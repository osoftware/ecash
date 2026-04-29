import 'dart:async';
import 'dart:typed_data';
// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../ecashaddr/cashaddr.dart';
import 'failover_proxy.dart';
import 'types.dart';
import 'utils.dart';
import 'validation.dart';
import 'chronik.pb.dart' as pb;

/// WebSocket endpoint for real-time blockchain updates
class WsEndpoint {
  final FailoverProxy _proxyInterface;
  final WsConfig config;
  final WsSubscriptions subs = WsSubscriptions();

  /// WebSocket connection (package-private for FailoverProxy access)
  WebSocketChannel? ws;

  /// Whether the connection was manually closed (package-private for FailoverProxy access)
  bool manuallyClosed = false;

  /// Completer for connection state (package-private for FailoverProxy access)
  Completer<void>? connected;

  bool autoReconnect = true;

  /// Called when a message is received from the WebSocket
  void Function(WsMsgClient)? onMessage;

  /// Called when a connection has been established
  void Function()? onConnect;

  /// Called before a reconnection attempt is made
  void Function(Object error)? onReconnect;

  /// Called when an error occurs with the WebSocket
  void Function(Object error)? onError;

  /// Called when the WebSocket is closed
  void Function()? onEnd;

  WsEndpoint(this._proxyInterface, {required this.config}) {
    onMessage = config.onMessage;
    onConnect = config.onConnect;
    onReconnect = config.onReconnect;
    autoReconnect = true;
    manuallyClosed = false;
  }

  /// Wait for the WebSocket to be connected
  Future<void> waitForOpen() async {
    await _proxyInterface.connectWs(this);
    await connected?.future;
  }

  /// Subscribe to block messages
  void subscribeToBlocks() {
    subs.blocks = true;
    if (ws != null) {
      _subUnsubBlocks(false);
    }
  }

  /// Unsubscribe from block messages
  void unsubscribeFromBlocks() {
    subs.blocks = false;
    if (ws != null) {
      _subUnsubBlocks(true);
    }
  }

  /// Subscribe to all tx messages
  void subscribeToTxs() {
    subs.txs = true;
    if (ws != null) {
      _subUnsubTxs(false);
    }
  }

  /// Unsubscribe from all tx messages
  void unsubscribeFromTxs() {
    subs.txs = false;
    if (ws != null) {
      _subUnsubTxs(true);
    }
  }

  /// Subscribe to the given script type and payload
  /// For "p2pkh", `scriptPayload` is the 20 byte public key hash
  void subscribeToScript(ScriptType type, String payload) {
    // Build sub according to chronik expected type
    final subscription = WsSubScriptClient(
      scriptType: type.value,
      payload: payload,
    );

    // We do not want to add invalid subs to ws.subs
    final scriptSubscriptionValidationCheck = isValidWsSubscription(
      subscription,
    );

    if (scriptSubscriptionValidationCheck != true) {
      // isValidWsSubscription returns string error msg if the sub is invalid
      throw ValidationException(scriptSubscriptionValidationCheck as String);
    }

    subs.scripts.add('${type.value}:$payload');

    if (ws != null) {
      _subUnsubScript(false, subscription);
    }
  }

  /// Unsubscribe from the given script type and payload
  void unsubscribeFromScript(ScriptType type, String payload) {
    // Build sub according to chronik expected type
    final subscription = WsSubScriptClient(
      scriptType: type.value,
      payload: payload,
    );

    // Find the requested unsub script and remove it
    final key = '${type.value}:$payload';
    if (!subs.scripts.contains(key)) {
      // If we cannot find this subscription in this.subs, throw an error
      // We do not want an app developer thinking they have unsubscribed from something
      throw ValidationException('No existing sub at ${type.value}, $payload');
    }

    // Remove the requested subscription from this.subs
    subs.scripts.remove(key);

    if (ws != null) {
      _subUnsubScript(true, subscription);
    }
  }

  /// Subscribe to an address
  /// Method can be used for p2pkh or p2sh addresses
  void subscribeToAddress(String address) {
    // Get type and hash
    final decoded = decodeCashAddress(address);

    // Subscribe to script
    subscribeToScript(ScriptType.from(decoded.type), decoded.hash);
  }

  /// Unsubscribe from the given address
  void unsubscribeFromAddress(String address) {
    // Get type and hash
    final decoded = decodeCashAddress(address);

    // Unsubscribe from script
    unsubscribeFromScript(ScriptType.from(decoded.type), decoded.hash);
  }

  /// Subscribe to a lokadId
  void subscribeToLokadId(String lokadId) {
    verifyLokadId(lokadId);

    // Update ws.subs to include this lokadId
    subs.lokadIds.add(lokadId);

    if (ws != null) {
      // Send subscribe msg to chronik server
      _subUnsubLokadId(false, lokadId);
    }
  }

  /// Unsubscribe from the given lokadId
  void unsubscribeFromLokadId(String lokadId) {
    // Find the requested unsub lokadId and remove it
    if (!subs.lokadIds.contains(lokadId)) {
      // If we cannot find this subscription in this.subs.lokadIds, throw an error
      // We do not want an app developer thinking they have unsubscribed from something if no action happened
      throw ValidationException('No existing sub at lokadId "$lokadId"');
    }

    // Remove the requested lokadId subscription from this.subs.lokadIds
    subs.lokadIds.remove(lokadId);

    if (ws != null) {
      // Send unsubscribe msg to chronik server
      _subUnsubLokadId(true, lokadId);
    }
  }

  /// Subscribe to a tokenId
  void subscribeToTokenId(String tokenId) {
    verifyTokenId(tokenId);

    // Update ws.subs to include this tokenId
    subs.tokenIds.add(tokenId);

    if (ws != null) {
      // Send subscribe msg to chronik server
      _subUnsubToken(false, tokenId);
    }
  }

  /// Unsubscribe from the given tokenId
  void unsubscribeFromTokenId(String tokenId) {
    // Find the requested unsub tokenId and remove it
    if (!subs.tokenIds.contains(tokenId)) {
      // If we cannot find this subscription in this.subs.tokenIds, throw an error
      // We do not want an app developer thinking they have unsubscribed from something if no action happened
      throw ValidationException('No existing sub at tokenId "$tokenId"');
    }

    // Remove the requested tokenId subscription from this.subs.tokenIds
    subs.tokenIds.remove(tokenId);

    if (ws != null) {
      // Send unsubscribe msg to chronik server
      _subUnsubToken(true, tokenId);
    }
  }

  /// Subscribe to a plugin
  void subscribeToPlugin(String pluginName, String group) {
    // Build sub according to chronik expected type
    final subscription = WsSubPluginClient(
      pluginName: pluginName,
      group: group,
    );

    verifyPluginSubscription(subscription);

    // Update ws.subs to include this plugin
    subs.plugins.add('$pluginName:$group');

    if (ws != null) {
      // Send subscribe msg to chronik server
      _subUnsubPlugin(false, subscription);
    }
  }

  /// Unsubscribe from the given plugin
  void unsubscribeFromPlugin(String pluginName, String group) {
    // Find the requested unsub script and remove it
    final key = '$pluginName:$group';
    if (!subs.plugins.contains(key)) {
      // If we cannot find this subscription in this.subs.plugins, throw an error
      // We do not want an app developer thinking they have unsubscribed from something
      throw ValidationException(
        'No existing sub at pluginName="$pluginName", group="$group"',
      );
    }

    // Remove the requested subscription from this.subs.plugins
    subs.plugins.remove(key);

    if (ws != null) {
      // Send unsubscribe msg to chronik server
      _subUnsubPlugin(
        true,
        WsSubPluginClient(pluginName: pluginName, group: group),
      );
    }
  }

  /// Subscribe to a txid
  void subscribeToTxid(String txid) {
    verifyTxid(txid);

    // Update ws.subs to include this txid
    subs.txids.add(txid);

    if (ws != null) {
      // Send subscribe msg to chronik server
      _subUnsubTxid(false, txid);
    }
  }

  /// Unsubscribe from the given txid
  void unsubscribeFromTxid(String txid) {
    // Find the requested unsub txid and remove it
    if (!subs.txids.contains(txid)) {
      // If we cannot find this subscription in this.subs.txids, throw an error
      // We do not want an app developer thinking they have unsubscribed from something if no action happened
      throw ValidationException('No existing sub to txid "$txid"');
    }

    // Remove the requested txid subscription from this.subs.txids
    subs.txids.remove(txid);

    if (ws != null) {
      // Send unsubscribe msg to chronik server
      _subUnsubTxid(true, txid);
    }
  }

  /// Close the WebSocket connection and prevent any future reconnection attempts
  void close() {
    manuallyClosed = true;
    ws?.sink.close();
  }

  /// Pause the WebSocket connection by disabling auto-reconnect and closing
  /// the connection. Useful when the app is backgrounded to save resources.
  ///
  /// Because we cannot predict the behavior of mobile operating systems handling
  /// websocket connections, it is better for the app developer to manually handle.
  ///
  /// We provide standard methods to accomplish this.
  void pause() {
    autoReconnect = false;
    if (ws != null) {
      // Note we DO NOT set manuallyClosed to true here, unlike the
      // public close() method, because we plan to re-open the websocket,
      // and we do not want to cycle through the failover proxy servers.
      ws?.sink.close();
    }
  }

  /// Resume the WebSocket connection by re-enabling auto-reconnect and
  /// reconnecting if the connection is closed. Useful when the app comes
  /// to foreground.
  Future<void> resume() async {
    // Don't resume if websocket was manually closed
    if (manuallyClosed) {
      return;
    }
    autoReconnect = true;
    // If the connection is closed, reconnect
    if (ws == null) {
      await _proxyInterface.connectWs(this);
      await connected?.future;
    }
  }

  void _subUnsubBlocks(bool isUnsub) {
    // Blocks subscription is empty object
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.blocks = pb.WsSubBlocks();
    if (ws == null) {
      throw StateError('Invalid state; ws is null');
    }
    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubTxs(bool isUnsub) {
    // Txs subscription is empty object
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.txs = pb.WsSubTxs();
    if (ws == null) {
      throw StateError('Invalid state; ws is null');
    }
    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubScript(bool isUnsub, WsSubScriptClient subscription) {
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.script = pb.WsSubScript(
      scriptType: subscription.scriptType,
      payload: Uint8List.fromList(hexToBytes(subscription.payload)),
    );

    if (ws == null) {
      throw StateError('Invalid state; ws is null');
    }

    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubLokadId(bool isUnsub, String lokadId) {
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.lokadId = pb.WsSubLokadId(
      // User input for lokadId is string
      // Chronik expects bytes
      lokadId: Uint8List.fromList(hexToBytes(lokadId)),
    );

    if (ws == null) {
      throw StateError('Invalid state; ws is null');
    }

    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubToken(bool isUnsub, String tokenId) {
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.tokenId = pb.WsSubTokenId(tokenId: tokenId);

    if (ws == null) {
      throw StateError('Invalid state; _ws is null');
    }

    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubTxid(bool isUnsub, String txid) {
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.txid = pb.WsSubTxId(txid: txid);

    if (ws == null) {
      throw StateError('Invalid state; _ws is null');
    }

    ws!.sink.add(request.writeToBuffer());
  }

  void _subUnsubPlugin(bool isUnsub, WsSubPluginClient plugin) {
    final request = pb.WsSub()..isUnsub = isUnsub;
    request.plugin = pb.WsPlugin(
      pluginName: plugin.pluginName,
      // User input for plugin group is string
      // Chronik expects bytes
      group: Uint8List.fromList(hexToBytes(plugin.group)),
    );

    if (ws == null) {
      throw StateError('Invalid state; ws is null');
    }

    ws!.sink.add(request.writeToBuffer());
  }

  /// Handle incoming WebSocket messages
  Future<void> handleMsg(List<int> msgData) async {
    if (onMessage == null) return;

    final msg = pb.WsMsg.fromBuffer(Uint8List.fromList(msgData));

    if (msg.hasError()) {
      onMessage!(WsErrorMsg(msg.error));
    } else if (msg.hasBlock()) {
      final block = msg.block;
      final msgBlock = WsMsgBlockClient(
        msgType: BlockMsgType.from(block.msgType.name),
        blockHash: block.blockHash.reversed.toHex(),
        blockHeight: block.blockHeight,
        blockTimestamp: block.blockTimestamp,
        coinbaseData: block.hasCoinbaseData() ? block.coinbaseData : null,
      );
      onMessage!(msgBlock);
    } else if (msg.hasTx()) {
      final txMsg = WsMsgTxClient(
        msgType: TxMsgType.from(msg.tx.msgType.name),
        txid: msg.tx.txid.reversed.toHex(),
        finalizationReasonType: msg.tx.hasFinalizationReason()
            ? TxFinalizationReasonType.from(
                msg.tx.finalizationReason.finalizationType.name,
              )
            : null,
      );
      onMessage!(txMsg);
    } else {
      // Silently ignore unknown Chronik message
    }
  }
}
