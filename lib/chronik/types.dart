/// Type definitions for Chronik client
library;

import 'package:fixnum/fixnum.dart';
import 'chronik.pb.dart' as pb;

export 'chronik.pb.dart';

// ============================================================================
// Enums
// ============================================================================

/// Connection strategy for the Chronik client
enum ConnectionStrategy {
  /// Select server based on WebSocket latency (fastest first)
  closestFirst,

  /// Use servers in the provided order
  asOrdered,
}

/// Type of script/address
enum ScriptType {
  p2pkh('p2pkh'),
  p2sh('p2sh'),
  p2pk('p2pk'),
  other('other');

  final String value;
  const ScriptType(this.value);

  factory ScriptType.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return other;
  }
}

/// Block message type from WebSocket
enum BlockMsgType {
  connected('BLK_CONNECTED'),
  disconnected('BLK_DISCONNECTED'),
  finalized('BLK_FINALIZED'),
  invalidated('BLK_INVALIDATED');

  final String value;
  const BlockMsgType(this.value);

  factory BlockMsgType.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    throw ArgumentError('Unknown BlockMsgType: $value');
  }
}

// ============================================================================
// Response Types (wrapping protocol buffer messages)
// ============================================================================

/// Response containing transaction details
typedef TxResponse = pb.Tx;

/// Response containing block information
typedef BlockResponse = pb.Block;

/// Response containing UTXO information
typedef UtxoResponse = pb.Utxo;

/// Response containing blockchain information
typedef BlockchainInfoResponse = pb.BlockchainInfo;

/// Response containing Chronik server information
typedef ChronikInfoResponse = pb.ChronikInfo;

/// Response containing token information
typedef TokenInfoResponse = pb.TokenInfo;

// ============================================================================
// Request/Response Types
// ============================================================================

/// Response for block transactions query
class BlockTxsResponse {
  final int page;
  final int pageSize;
  final List<pb.Tx> txs;

  BlockTxsResponse({
    required this.page,
    required this.pageSize,
    required this.txs,
  });
}

/// Response for script/address history query
class HistoryResponse {
  final int page;
  final int pageSize;
  final List<pb.Tx> txs;

  HistoryResponse({
    required this.page,
    required this.pageSize,
    required this.txs,
  });
}

/// Response for confirmed transactions query
class ConfirmedTxsResponse {
  final int page;
  final int pageSize;
  final List<pb.Tx> txs;

  ConfirmedTxsResponse({
    required this.page,
    required this.pageSize,
    required this.txs,
  });
}

/// Response for unconfirmed transactions query
class UnconfirmedTxsResponse {
  final List<pb.Tx> txs;

  UnconfirmedTxsResponse({required this.txs});
}

/// Response for UTXO query
class UtxosResponse {
  final List<pb.Utxo> utxos;

  UtxosResponse({required this.utxos});
}

/// Response for broadcast transaction
class BroadcastResponse {
  final String txid;

  BroadcastResponse({required this.txid});
}

/// Response for broadcast and finalize transaction
class BroadcastAndFinalizeResponse {
  final String txid;

  BroadcastAndFinalizeResponse({required this.txid});
}

/// Response for transaction validation
class ValidateRawTxResponse {
  final String? error;
  final String? warnings;

  ValidateRawTxResponse({this.error, this.warnings});
}

/// Response for plugin groups query
class GroupsResponse {
  final List<pb.PluginGroup> groups;

  GroupsResponse({required this.groups});
}

// ============================================================================
// WebSocket Types
// ============================================================================

/// WebSocket subscriptions state
class WsSubscriptions {
  /// Subscriptions to scripts {type}/{payload}
  final Set<String> scripts = {};

  /// Subscriptions to token IDs
  final Set<String> tokenIds = {};

  /// Subscriptions to lokad IDs
  final Set<String> lokadIds = {};

  /// Subscriptions to transaction IDs
  final Set<String> txids = {};

  /// Subscriptions to plugins {name}/{groupHex}
  final Set<String> plugins = {};

  /// Whether subscribed to all blocks
  bool blocks = false;

  /// Whether subscribed to all transactions
  bool txs = false;

  void clear() {
    scripts.clear();
    tokenIds.clear();
    lokadIds.clear();
    txids.clear();
    plugins.clear();
    blocks = false;
    txs = false;
  }
}

/// WebSocket configuration
class WsConfig {
  /// Called when a WebSocket message is received
  final void Function(WsMsgClient)? onMessage;

  /// Called when WebSocket connects
  final void Function()? onConnect;

  /// Called before a reconnection attempt
  final void Function(Object error)? onReconnect;

  /// Whether to keep the connection alive with periodic pings
  final bool keepAlive;

  WsConfig({
    this.onMessage,
    this.onConnect,
    this.onReconnect,
    this.keepAlive = false,
  });
}

/// WebSocket message from server
sealed class WsMsgClient {
  const WsMsgClient();
}

/// Error message from WebSocket
class WsErrorMsg extends WsMsgClient {
  final Object error;

  WsErrorMsg(this.error);
}

/// Block message from WebSocket
class WsMsgBlockClient extends WsMsgClient {
  final BlockMsgType msgType;
  final String blockHash;
  final int blockHeight;
  final Int64 blockTimestamp;
  final pb.CoinbaseData? coinbaseData;

  WsMsgBlockClient({
    required this.msgType,
    required this.blockHash,
    required this.blockHeight,
    required this.blockTimestamp,
    this.coinbaseData,
  });
}

/// Transaction message from WebSocket
class WsMsgTxClient extends WsMsgClient {
  final pb.Tx tx;

  WsMsgTxClient({required this.tx});
}

// ============================================================================
// Error Types
// ============================================================================

/// Exception thrown by Chronik client
class ChronikException implements Exception {
  final String message;
  final Object? originalError;
  final StackTrace? originalStackTrace;

  ChronikException(this.message, {this.originalError, this.originalStackTrace});

  @override
  String toString() => 'ChronikException: $message';
}

/// Exception thrown when a server is not responsive
class ServerException extends ChronikException {
  ServerException(String message, {Object? originalError})
    : super(message, originalError: originalError);
}

/// Exception thrown when validation fails
class ValidationException extends ChronikException {
  ValidationException(String message) : super(message);
}

/// Exception thrown when all failover servers have been exhausted
class AllServersFailedException extends ChronikException {
  final List<String> failedServers;

  AllServersFailedException(String message, {required this.failedServers})
    : super(message);
}
