import 'dart:async';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../chronik.dart';

part 'failover_proxy.freezed.dart';

/// A pair of Chronik HTTP and WebSocket endpoint urls
@freezed
class Endpoint with _$Endpoint {
  /// URL for Chronik's HTTP interface
  @override
  final String url;

  /// URL for Chronik's WebSocket interface
  @override
  final String wsUrl;

  Endpoint({required this.url, required this.wsUrl});
}

const kWebsocketTimeout = Duration(milliseconds: 5000);

/// Converts an array of chronik http/https urls into
/// websocket equivalents and combines them into an object array
List<Endpoint> appendWsUrls(List<String> urls) {
  final combinedUrls = <Endpoint>[];
  for (final thisUrl in urls) {
    if (thisUrl.startsWith('https://')) {
      combinedUrls.add(
        Endpoint(
          url: thisUrl,
          wsUrl: 'wss://${thisUrl.substring('https://'.length)}/ws',
        ),
      );
    } else if (thisUrl.startsWith('http://')) {
      combinedUrls.add(
        Endpoint(
          url: thisUrl,
          wsUrl: 'ws://${thisUrl.substring('http://'.length)}/ws',
        ),
      );
    } else {
      throw ValidationException('Invalid url found in array: $thisUrl');
    }
  }

  return combinedUrls;
}

/// Handles the networking to Chronik Endpoints, including cycling
/// through both types of endpoints.
class FailoverProxy {
  late List<Endpoint> _endpointArray;
  late int _workingIndex;
  final http.Client _httpClient = http.Client();

  FailoverProxy(List<String> urls) {
    // Validate url input
    if (urls.isEmpty) {
      throw ValidationException('Url array must not be empty');
    }

    // Validate each entry in the url array
    for (final url in urls) {
      if (url.endsWith('/')) {
        throw ValidationException("`url` cannot end with '/', got: $url");
      }
      if (!url.startsWith('https://') && !url.startsWith('http://')) {
        throw ValidationException(
          "`url` must start with 'https://' or 'http://', got: $url",
        );
      }
    }

    // Initializes _endpointArray with an object Array containing
    // 'url' and 'wsUrl' props
    _endpointArray = appendWsUrls(urls);
    _workingIndex = 0;
  }

  /// For unit test verification
  List<Endpoint> get endpointArray => List.unmodifiable(_endpointArray);

  /// Derives the endpoint array index based on _workingIndex
  /// This is set to public for unit testing purposes
  int deriveEndpointIndex(int loopIndex) {
    return (_workingIndex + loopIndex) % _endpointArray.length;
  }

  /// Overriding working index for unit testing purposes
  void setWorkingIndex(int newIndex) {
    _workingIndex = newIndex;
  }

  /// Get the currently working endpoint
  Endpoint get workingEndpoint => _endpointArray[_workingIndex];

  /// Make an HTTP GET request with failover support
  Future<List<int>> get(String path) async {
    return await _request(path, 'GET');
  }

  /// Make an HTTP POST request with failover support
  Future<List<int>> post(String path, Uint8List data) async {
    return await _request(path, 'POST', data);
  }

  /// Returns a GET or POST response from the Chronik indexer
  ///
  /// Cycles through known Chronik instances until one succeeds.
  /// Throws an error on non-responsive servers or valid error responses.
  Future<List<int>> _request(
    String path,
    String requestType, [
    Uint8List? data,
  ]) async {
    // Cycle through known Chronik instances
    for (int i = 0; i < _endpointArray.length; i += 1) {
      final index = deriveEndpointIndex(i);
      final thisProxyUrl = _endpointArray[index].url;
      try {
        final response = await _callHttp(thisProxyUrl, path, requestType, data);
        // If no errors thrown in the above call then set this index to state
        _workingIndex = index;
        return response;
      } catch (err) {
        if (err is ValidationException) {
          // Don't try next server for validation errors
          rethrow;
        }

        if (err is Exception) {
          final errStr = err.toString();
          // Connection errors and indexing server errors should trigger failover
          if (errStr.contains('Unable to decode') ||
              errStr.contains('Connection') ||
              errStr.trim().endsWith(':') ||
              errStr.contains('TimeoutException')) {
            // Server outage, skip to next url in loop
            continue;
          }
        }

        // Throw upon all other valid error responses from chronik
        rethrow;
      }
    }
    // All known Chronik instances have not been responsive
    throw AllServersFailedException(
      'Error connecting to known Chronik instances',
      failedServers: _endpointArray.map((e) => e.url).toList(),
    );
  }

  /// Calls HTTP for a GET or POST response
  ///
  /// Returns the response data as bytes.
  /// Throws an error on non-responsive server or valid error responses.
  Future<List<int>> _callHttp(
    String url,
    String path,
    String requestType, [
    Uint8List? data,
  ]) async {
    late http.Response response;
    final fullUrl = Uri.parse('$url$path');

    try {
      if (requestType == 'GET') {
        response = await _httpClient
            .get(fullUrl)
            .timeout(const Duration(seconds: 10));
      } else if (requestType == 'POST') {
        response = await _httpClient
            .post(
              fullUrl,
              body: data,
              headers: {'Content-Type': 'application/x-protobuf'},
            )
            .timeout(const Duration(seconds: 10));
      } else {
        throw StateError('Invalid request type: $requestType');
      }
    } catch (e) {
      if (e is TimeoutException) {
        throw ServerException('Request timeout: $e');
      }
      rethrow;
    }

    // Parse for valid error responses (e.g. txid not found)
    _ensureResponseErrorThrown(response, path);
    return response.bodyBytes;
  }

  /// Ensures response errors are thrown appropriately
  void _ensureResponseErrorThrown(http.Response response, String path) {
    if (response.statusCode != 200) {
      throw ServerException(
        'Failed getting $path: HTTP ${response.statusCode}',
      );
    }
  }

  /// Test if a given WebSocket URL connects successfully
  ///
  /// Returns true if the connection succeeds, false otherwise.
  /// Respects the WEBSOCKET_TIMEOUT_MS timeout.
  Future<bool> _websocketUrlConnects(String wsUrl) async {
    try {
      final channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      late bool result;

      // Set up timeout
      final timer = Timer(kWebsocketTimeout, () {
        channel.sink.close();
        result = false;
      });

      // Listen for connection
      final subscription = channel.stream.listen(
        (_) {
          timer.cancel();
          result = true;
          channel.sink.close();
        },
        onError: (_) {
          timer.cancel();
          channel.sink.close();
          result = false;
        },
        onDone: () {
          if (!result) {
            result = false;
          }
        },
      );

      // Wait a bit for the connection
      await Future.delayed(const Duration(milliseconds: 100));
      subscription.cancel();

      return result;
    } catch (_) {
      return false;
    }
  }

  /// Iterates through available websocket urls and attempts connection.
  /// Upon a successful connection it handles the various websocket callbacks.
  /// Upon an unsuccessful connection it iterates to the next websocket url in the array.
  Future<void> connectWs(WsEndpoint wsEndpoint) async {
    for (int i = 0; i < _endpointArray.length; i += 1) {
      final index = deriveEndpointIndex(i);
      final thisProxyWsUrl = _endpointArray[index].wsUrl;
      final websocketUrlConnects = await _websocketUrlConnects(thisProxyWsUrl);

      if (websocketUrlConnects) {
        // Set this index to state
        _workingIndex = index;

        try {
          final channel = WebSocketChannel.connect(Uri.parse(thisProxyWsUrl));

          // Set up message handler
          channel.stream.listen(
            (message) {
              if (wsEndpoint.onMessage != null) {
                wsEndpoint.handleMsg(message as List<int>);
              }
            },
            onError: (error) {
              if (wsEndpoint.onError != null) {
                wsEndpoint.onError!(error);
                wsEndpoint.close();
              }
            },
            onDone: () {
              // End if manually closed or no auto-reconnect
              if (wsEndpoint.manuallyClosed || !wsEndpoint.autoReconnect) {
                if (wsEndpoint.onEnd != null) {
                  wsEndpoint.onEnd!();
                }
                return;
              }

              if (wsEndpoint.onReconnect != null) {
                wsEndpoint.onReconnect!(Exception('WebSocket disconnected'));
              }

              _workingIndex = (_workingIndex + 1) % _endpointArray.length;
              connectWs(wsEndpoint);
            },
          );

          // Store the channel in the endpoint
          wsEndpoint.ws = channel;

          // Create the connected completer
          wsEndpoint.connected = Completer<void>();

          // Handle the open event by resubscribing
          // We use a small delay to ensure the connection is ready
          await Future.delayed(const Duration(milliseconds: 100));

          // Subscribe to all previously-subscribed scripts
          for (final scriptKey in wsEndpoint.subs.scripts) {
            final parts = scriptKey.split(':');
            if (parts.length == 2) {
              wsEndpoint.subscribeToScript(ScriptType.from(parts[0]), parts[1]);
            }
          }

          // Subscribe to all previously-subscribed lokadIds
          for (final lokadId in wsEndpoint.subs.lokadIds) {
            wsEndpoint.subscribeToLokadId(lokadId);
          }

          // Subscribe to all previously-subscribed tokenIds
          for (final tokenId in wsEndpoint.subs.tokenIds) {
            wsEndpoint.subscribeToTokenId(tokenId);
          }

          // Subscribe to all previously-subscribed txids
          for (final txid in wsEndpoint.subs.txids) {
            wsEndpoint.subscribeToTxid(txid);
          }

          // Subscribe to blocks method, if previously subscribed
          if (wsEndpoint.subs.blocks) {
            wsEndpoint.subscribeToBlocks();
          }

          // Subscribe to txs method, if previously subscribed
          if (wsEndpoint.subs.txs) {
            wsEndpoint.subscribeToTxs();
          }

          // Complete the connected future
          if (!wsEndpoint.connected!.isCompleted) {
            wsEndpoint.connected!.complete();
          }

          // Call the onConnect callback
          if (wsEndpoint.onConnect != null) {
            wsEndpoint.onConnect!();
          }

          // If no errors thrown from above call then set this index to state
          _workingIndex = index;
          return;
        } catch (e) {
          // Connection setup failed, try next server
          continue;
        }
      }
    }

    // If no websocket URLs connect, throw error
    throw AllServersFailedException(
      'Error connecting to known Chronik websockets',
      failedServers: _endpointArray.map((e) => e.wsUrl).toList(),
    );
  }

  /// Close the HTTP client
  void close() {
    _httpClient.close();
  }
}
