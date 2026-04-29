/// WebSocket endpoint for Chronik client
library;

import 'dart:async';
import 'failover_proxy.dart';
import 'types.dart';

/// WebSocket endpoint for real-time blockchain updates
class WsEndpoint {
  final List<String> urls;
  final WsConfig config;
  final WsSubscriptions subscriptions = WsSubscriptions();

  late FailoverProxy _proxy;
  Timer? _keepAliveTimer;
  bool _isConnected = false;
  bool _isPaused = false;
  Completer<void>? _openCompleter;

  WsEndpoint({required this.urls, required this.config}) {
    _proxy = FailoverProxy(urls);
  }

  /// Whether the WebSocket is currently connected
  bool get isConnected => _isConnected;

  /// Whether the WebSocket is paused (for mobile apps)
  bool get isPaused => _isPaused;

  /// Wait for the WebSocket to be connected
  Future<void> waitForOpen() async {
    if (_isConnected) return;
    _openCompleter = Completer<void>();
    await _openCompleter!.future;
  }

  /// Subscribe to block updates
  void subscribeToBlocks() {
    subscriptions.blocks = true;
    _sendSubscription();
  }

  /// Unsubscribe from block updates
  void unsubscribeFromBlocks() {
    subscriptions.blocks = false;
    _sendSubscription();
  }

  /// Subscribe to script/address updates
  void subscribeToScript(String scriptType, String scriptPayload) {
    subscriptions.scripts.add('$scriptType:$scriptPayload');
    _sendSubscription();
  }

  /// Unsubscribe from script/address updates
  void unsubscribeFromScript(String scriptType, String scriptPayload) {
    subscriptions.scripts.remove('$scriptType:$scriptPayload');
    _sendSubscription();
  }

  /// Subscribe to address updates (eCash address format)
  void subscribeToAddress(String address) {
    subscriptions.scripts.add('address:$address');
    _sendSubscription();
  }

  /// Unsubscribe from address updates
  void unsubscribeFromAddress(String address) {
    subscriptions.scripts.remove('address:$address');
    _sendSubscription();
  }

  /// Subscribe to token ID updates
  void subscribeToTokenId(String tokenId) {
    subscriptions.tokenIds.add(tokenId);
    _sendSubscription();
  }

  /// Unsubscribe from token ID updates
  void unsubscribeFromTokenId(String tokenId) {
    subscriptions.tokenIds.remove(tokenId);
    _sendSubscription();
  }

  /// Subscribe to lokad ID updates
  void subscribeToLokadId(String lokadId) {
    subscriptions.lokadIds.add(lokadId);
    _sendSubscription();
  }

  /// Unsubscribe from lokad ID updates
  void unsubscribeFromLokadId(String lokadId) {
    subscriptions.lokadIds.remove(lokadId);
    _sendSubscription();
  }

  /// Subscribe to transaction ID updates
  void subscribeToTxid(String txid) {
    subscriptions.txids.add(txid);
    _sendSubscription();
  }

  /// Unsubscribe from transaction ID updates
  void unsubscribeFromTxid(String txid) {
    subscriptions.txids.remove(txid);
    _sendSubscription();
  }

  /// Subscribe to all transaction updates
  void subscribeToTxs() {
    subscriptions.txs = true;
    _sendSubscription();
  }

  /// Unsubscribe from all transaction updates
  void unsubscribeFromTxs() {
    subscriptions.txs = false;
    _sendSubscription();
  }

  /// Subscribe to plugin updates
  void subscribeToPlugin(String pluginName, String groupHex) {
    subscriptions.plugins.add('$pluginName:$groupHex');
    _sendSubscription();
  }

  /// Unsubscribe from plugin updates
  void unsubscribeFromPlugin(String pluginName, String groupHex) {
    subscriptions.plugins.remove('$pluginName:$groupHex');
    _sendSubscription();
  }

  /// Close the WebSocket connection
  void close() {
    _isConnected = false;
    _keepAliveTimer?.cancel();
    _proxy.close();
  }

  /// Pause the WebSocket connection (for mobile apps)
  /// Stops reconnection attempts and closes the connection
  void pause() {
    _isPaused = true;
    _keepAliveTimer?.cancel();
    _isConnected = false;
  }

  /// Resume the WebSocket connection (for mobile apps)
  Future<void> resume() async {
    _isPaused = false;
    if (_openCompleter == null || _openCompleter!.isCompleted) {
      _openCompleter = Completer<void>();
    }
    // Reconnect if needed - in a real implementation
    await waitForOpen();
  }

  /// Send subscription message to server
  void _sendSubscription() {
    // In a real implementation, this would send a protobuf subscription message
    // to the WebSocket server with current subscription state
  }
}
