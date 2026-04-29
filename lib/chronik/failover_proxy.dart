/// Failover proxy for handling HTTP/WebSocket requests with server failover
library;

import 'dart:async';
import 'package:http/http.dart' as http;
import 'types.dart';

/// Handles HTTP requests with automatic failover to the next server
class FailoverProxy {
  final List<String> urls;
  late int _workingUrlIndex;
  final http.Client _httpClient = http.Client();

  FailoverProxy(this.urls) {
    if (urls.isEmpty) {
      throw ValidationException('At least one server URL is required');
    }
    _workingUrlIndex = 0;
  }

  /// Get the currently working URL
  String get workingUrl => urls[_workingUrlIndex];

  /// Get all URLs
  List<String> getUrls() => List.unmodifiable(urls);

  /// Make an HTTP GET request with failover support
  Future<List<int>> get(String path) async {
    int attemptCount = 0;
    Object? lastError;

    while (attemptCount < urls.length) {
      try {
        final url = _buildUrl(workingUrl, path);
        final response = await _httpClient
            .get(url)
            .timeout(const Duration(seconds: 10));

        if (response.statusCode >= 400) {
          _handleError(response);
        }

        return response.bodyBytes;
      } catch (e) {
        lastError = e;
        attemptCount++;

        if (!_isRecoverableError(e)) {
          // Don't try next server for validation errors
          rethrow;
        }

        if (attemptCount < urls.length) {
          _tryNextServer();
        }
      }
    }

    throw AllServersFailedException(
      'All servers failed. Last error: $lastError',
      failedServers: urls,
    );
  }

  /// Make an HTTP POST request with failover support
  Future<List<int>> post(String path, List<int> data) async {
    int attemptCount = 0;
    Object? lastError;

    while (attemptCount < urls.length) {
      try {
        final url = _buildUrl(workingUrl, path);
        final response = await _httpClient
            .post(
              url,
              body: data,
              headers: {'Content-Type': 'application/x-protobuf'},
            )
            .timeout(const Duration(seconds: 10));

        if (response.statusCode >= 400) {
          _handleError(response);
        }

        return response.bodyBytes;
      } catch (e) {
        lastError = e;
        attemptCount++;

        if (!_isRecoverableError(e)) {
          // Don't try next server for validation errors
          rethrow;
        }

        if (attemptCount < urls.length) {
          _tryNextServer();
        }
      }
    }

    throw AllServersFailedException(
      'All servers failed. Last error: $lastError',
      failedServers: urls,
    );
  }

  /// Test WebSocket connectivity to a URL
  /// Returns the URL if successful, throws otherwise
  Future<String> connectWs(String wsUrl) async {
    try {
      // Try to connect to the WebSocket URL
      // This is a basic test; actual WebSocket connection happens later
      final httpUrl = wsUrl.replaceFirst(RegExp(r'^wss?://'), 'https://');
      final response = await _httpClient
          .head(Uri.parse(httpUrl))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode >= 400) {
        throw ServerException(
          'WebSocket URL returned error: ${response.statusCode}',
        );
      }

      return wsUrl;
    } catch (e) {
      if (!_isRecoverableError(e)) {
        rethrow;
      }
      _tryNextServer();
      return connectWs(workingUrl.replaceFirst('http', 'ws'));
    }
  }

  /// Build full URL from base and path
  Uri _buildUrl(String baseUrl, String path) {
    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return Uri.parse('$base$path');
  }

  /// Handle HTTP error responses
  void _handleError(http.Response response) {
    if (response.statusCode == 422) {
      // Validation error - decode and throw
      throw ValidationException('Server validation error: ${response.body}');
    }

    if (response.statusCode >= 500) {
      throw ServerException('Server error: ${response.statusCode}');
    }

    throw ServerException('HTTP error: ${response.statusCode}');
  }

  /// Check if an error is recoverable (i.e., we should try next server)
  bool _isRecoverableError(Object error) {
    if (error is ValidationException) return false;

    final errorString = error.toString();

    // Connection errors are recoverable
    if (errorString.contains('Connection refused') ||
        errorString.contains('Connection reset') ||
        errorString.contains('Connection timed out') ||
        errorString.contains('Unable to decode') ||
        errorString.contains('TimeoutException')) {
      return true;
    }

    return false;
  }

  /// Move to the next server in the list
  void _tryNextServer() {
    _workingUrlIndex = (_workingUrlIndex + 1) % urls.length;
  }

  /// Close the HTTP client
  void close() {
    _httpClient.close();
  }
}
