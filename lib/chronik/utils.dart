/// Utility functions for Chronik client
library;

import 'dart:async';
import 'package:http/http.dart' as http;

/// Measure WebSocket connection latency to a given URL
///
/// Returns the latency in milliseconds, or [double.infinity] if the connection
/// fails or times out (after 1000ms).
Future<double> measureWebsocketLatency(String wsUrl) async {
  final stopwatch = Stopwatch()..start();
  try {
    final uri = Uri.parse(wsUrl);
    final httpUrl = uri.replace(scheme: uri.scheme == 'wss' ? 'https' : 'http');

    // Try HTTP ping as a proxy for WebSocket latency
    final response = await http
        .get(httpUrl)
        .timeout(const Duration(milliseconds: 5000))
        .catchError((_) => http.Response('', 500));

    stopwatch.stop();

    return response.statusCode < 500
        ? stopwatch.elapsedMilliseconds.toDouble()
        : double.infinity;
  } catch (_) {
    return double.infinity;
  }
}

/// Sort a list of server URLs by their WebSocket latency (fastest first)
///
/// Returns URLs sorted in ascending order of latency. Unreachable servers
/// are placed at the end with [double.infinity] latency.
Future<List<String>> sortNodesByLatency(List<String> urls) async {
  final results = <(String url, double latency)>[];

  await Future.wait(
    urls.map((url) async {
      final latency = await measureWebsocketLatency(url);
      results.add((url, latency));
    }),
  );

  results.sort((a, b) => a.$2.compareTo(b.$2));
  return results.map((r) => r.$1).toList();
}

/// Convert a hex string to bytes
List<int> hexToBytes(String hex) {
  final bytes = <int>[];
  for (var i = 0; i < hex.length; i += 2) {
    bytes.add(int.parse(hex.substring(i, i + 2), radix: 16));
  }
  return bytes;
}

/// Convert bytes to hex string
String bytesToHex(List<int> bytes) {
  return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
}

/// Validate a token ID (should be 32 bytes in hex format)
bool isValidTokenId(String tokenId) {
  return tokenId.length == 64 && _isValidHex(tokenId);
}

/// Validate a transaction ID (should be 32 bytes in hex format)
bool isValidTxId(String txId) {
  return txId.length == 64 && _isValidHex(txId);
}

/// Validate a lokad ID (should be 4 bytes in hex format)
bool isValidLokadId(String lokadId) {
  return lokadId.length == 8 && _isValidHex(lokadId);
}

/// Check if a string is valid hexadecimal
bool _isValidHex(String value) {
  try {
    int.parse(value, radix: 16);
    return true;
  } catch (_) {
    return false;
  }
}

/// Convert a script type string to normalized ScriptType enum value
String normalizeScriptType(String scriptType) {
  return scriptType.toLowerCase();
}
