import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chronik.pb.dart' as pb;
import 'utils.dart';

export 'chronik.pb.dart';

part 'types.freezed.dart';

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

@freezed
class TokenInfo with _$TokenInfo {
  @override
  final String tokenId;
  @override
  final TokenType tokenType;
  @override
  final GenesisInfo genesisInfo;
  @override
  final BlockMetadata? block;
  @override
  final int timeFirstSeen;

  TokenInfo({
    required this.tokenId,
    required this.tokenType,
    required this.genesisInfo,
    required this.timeFirstSeen,
    this.block,
  });

  factory TokenInfo.fromProto(pb.TokenInfo proto) => convertToTokenInfo(proto);
}

@freezed
class GenesisInfo with _$GenesisInfo {
  @override
  final String tokenTicker;
  @override
  final String tokenName;
  @override
  final String url;
  @override
  final String? hash;
  @override
  final String? mintVaultScripthash;
  @override
  final String? data;
  @override
  final String? authPubKey;
  @override
  final int decimals;

  GenesisInfo({
    required this.tokenTicker,
    required this.tokenName,
    required this.url,
    this.hash,
    this.mintVaultScripthash,
    this.data,
    this.authPubKey,
    required this.decimals,
  });
}

// ============================================================================
// Request/Response Types
// ============================================================================

@freezed
class TxHistoryPage with _$TxHistoryPage {
  @override
  final int numPages;
  @override
  final int numTxs;
  @override
  final List<Tx> txs;

  TxHistoryPage({
    required this.numPages,
    required this.numTxs,
    required this.txs,
  });

  factory TxHistoryPage.fromProto(pb.TxHistoryPage proto) => TxHistoryPage(
    numPages: proto.numPages,
    numTxs: proto.numTxs,
    txs: proto.txs.map(Tx.fromProto).toList(),
  );
}

/// Response for confirmed transactions query
@freezed
class ConfirmedTxsResponse with _$ConfirmedTxsResponse {
  @override
  final int page;
  @override
  final int pageSize;
  @override
  final List<Tx> txs;

  ConfirmedTxsResponse({
    required this.page,
    required this.pageSize,
    required this.txs,
  });
}

/// Response for UTXO query
@freezed
class UtxosResponse with _$UtxosResponse {
  @override
  final List<Utxo> utxos;

  UtxosResponse({required this.utxos});
}

/// Response for broadcast transaction
@freezed
class BroadcastResponse with _$BroadcastResponse {
  @override
  final String txid;

  BroadcastResponse({required this.txid});
}

/// Response for broadcast transaction
@freezed
class BroadcastTxsResponse with _$BroadcastTxsResponse {
  @override
  final List<String> txids;

  BroadcastTxsResponse({required this.txids});
}

/// Response for plugin groups query
@freezed
class PluginGroups with _$PluginGroups {
  @override
  final List<PluginGroup> groups;

  @override
  final String nextStart;

  PluginGroups({required this.groups, required this.nextStart});
}

@freezed
class PluginGroup with _$PluginGroup {
  @override
  final String group;

  PluginGroup({required this.group});

  factory PluginGroup.fromProto(pb.PluginGroup proto) =>
      PluginGroup(group: proto.group.toHex());
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

@freezed
sealed class WsMsgClient with _$WsMsgClient {
  const factory WsMsgClient.error(pb.Error error) = WsErrorMsg;
  const factory WsMsgClient.block({
    required BlockMsgType msgType,
    required String blockHash,
    required int blockHeight,
    required Int64 blockTimestamp,
    pb.CoinbaseData? coinbaseData,
  }) = WsMsgBlockClient;
  const factory WsMsgClient.tx({
    required TxMsgType msgType,
    required String txid,
    TxFinalizationReasonType? finalizationReasonType,
  }) = WsMsgTxClient;
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
  ServerException(super.message, {super.originalError});
}

/// Exception thrown when validation fails
class ValidationException extends ChronikException {
  ValidationException(super.message);
}

/// Exception thrown when all failover servers have been exhausted
class AllServersFailedException extends ChronikException {
  final List<String> failedServers;

  AllServersFailedException(super.message, {required this.failedServers});
}

// ============================================================================
// WebSocket Subscription Types
// ============================================================================

/// WebSocket subscription for a script/address
@freezed
class WsSubScriptClient with _$WsSubScriptClient {
  /// Script type to subscribe to ("p2pkh", "p2sh", "p2pk", "other")
  @override
  final String scriptType;

  /// Payload for the given script type:
  /// - 20-byte hash for "p2pkh" and "p2sh"
  /// - 33-byte or 65-byte pubkey for "p2pk"
  /// - Serialized script for "other"
  @override
  final String payload;

  WsSubScriptClient({required this.scriptType, required this.payload});
}

/// WebSocket subscription for a plugin
@freezed
class WsSubPluginClient with _$WsSubPluginClient {
  /// Plugin name as lower-case hex string
  @override
  final String pluginName;

  /// Group as lower-case hex string
  @override
  final String group;

  WsSubPluginClient({required this.pluginName, required this.group});
}

@freezed
class BlockchainInfo with _$BlockchainInfo {
  @override
  final String tipHash;
  @override
  final int tipHeight;

  BlockchainInfo({required this.tipHash, required this.tipHeight});
}

@freezed
class ChronikInfo with _$ChronikInfo {
  @override
  final String version;

  ChronikInfo({required this.version});
}

/// Block information for a chronik block
@freezed
class BlockInfo with _$BlockInfo {
  /// Block hash of the block, in 'human-readable' (big-endian) hex encoding.
  @override
  final String hash;

  /// Block hash of the prev block, in 'human-readable' (big-endian) hex encoding.
  @override
  final String prevHash;

  /// Height of the block; Genesis block has height 0.
  @override
  final int height;

  /// nBits field of the block, encodes the target compactly.
  @override
  final int nBits;

  /// Timestamp of the block. Filled in by the miner, so might not be 100 % precise.
  @override
  final int timestamp;

  /// Is this block avalanche finalized?
  @override
  final bool isFinal;

  /// Block size of this block in bytes (including headers etc.).
  @override
  final int blockSize;

  /// Number of txs in this block.
  @override
  final int numTxs;

  /// Total number of tx inputs in block (including coinbase).
  @override
  final int numInputs;

  /// Total number of tx output in block (including coinbase).
  @override
  final int numOutputs;

  /// Total number of satoshis spent by tx inputs.
  @override
  final int sumInputSats;

  /// Total block reward for this block.
  @override
  final int sumCoinbaseOutputSats;

  /// Total number of satoshis in non-coinbase tx outputs.
  @override
  final int sumNormalOutputSats;

  /// Total number of satoshis burned using OP_RETURN.
  @override
  final int sumBurnedSats;

  BlockInfo({
    required this.hash,
    required this.prevHash,
    required this.height,
    required this.nBits,
    required this.timestamp,
    required this.isFinal,
    required this.blockSize,
    required this.numTxs,
    required this.numInputs,
    required this.numOutputs,
    required this.sumInputSats,
    required this.sumCoinbaseOutputSats,
    required this.sumNormalOutputSats,
    required this.sumBurnedSats,
  });

  factory BlockInfo.fromProto(pb.BlockInfo proto) => convertToBlockInfo(proto);
}

/// Block data for in-node chronik
@freezed
class Block with _$Block {
  /// Contains the blockInfo object defined above
  @override
  final BlockInfo blockInfo;

  Block({required this.blockInfo});

  factory Block.fromProto(pb.Block proto) => convertToBlock(proto);
}

// ============================================================================
// Transaction Types
// ============================================================================

/// Outpoint referencing an output on the blockchain
@freezed
class OutPoint with _$OutPoint {
  /// Transaction ID (big-endian hex)
  @override
  final String txid;

  /// Index of the output in the transaction
  @override
  final int outIdx;

  OutPoint({required this.txid, required this.outIdx});
}

@freezed
sealed class TokenType with _$TokenType {
  const factory TokenType.slp({
    required SlpTokenTypeValue type,
    required int number,
  }) = SlpTokenType;
  const factory TokenType.alp({
    required AlpTokenTypeValue type,
    required int number,
  }) = AlpTokenType;
  const factory TokenType.unknown() = UnknownTokenType;
}

/// Possible ALP token types
enum AlpTokenTypeValue {
  standard('ALP_TOKEN_TYPE_STANDARD'),
  unknown('ALP_TOKEN_TYPE_UNKNOWN');

  final String value;
  const AlpTokenTypeValue(this.value);

  factory AlpTokenTypeValue.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return unknown;
  }
}

/// Possible SLP token types
enum SlpTokenTypeValue {
  fungible('SLP_TOKEN_TYPE_FUNGIBLE'),
  mintVault('SLP_TOKEN_TYPE_MINT_VAULT'),
  nft1Group('SLP_TOKEN_TYPE_NFT1_GROUP'),
  nft1Child('SLP_TOKEN_TYPE_NFT1_CHILD'),
  unknown('SLP_TOKEN_TYPE_UNKNOWN');

  final String value;
  const SlpTokenTypeValue(this.value);

  factory SlpTokenTypeValue.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return unknown;
  }
}

/// Token status enumeration
enum TokenStatus {
  nonToken('TOKEN_STATUS_NON_TOKEN'),
  normal('TOKEN_STATUS_NORMAL'),
  notNormal('TOKEN_STATUS_NOT_NORMAL'),
  unknown('TOKEN_STATUS_UNKNOWN');

  final String value;
  const TokenStatus(this.value);

  factory TokenStatus.from(String value) {
    for (var status in values) {
      if (status.value == value) return status;
    }
    return unknown;
  }
}

/// Token transaction type
enum TokenTxType {
  none('NONE'),
  unknown('UNKNOWN'),
  genesis('GENESIS'),
  send('SEND'),
  mint('MINT'),
  burn('BURN');

  final String value;
  const TokenTxType(this.value);

  factory TokenTxType.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return unknown;
  }
}

/// Token transaction finalization reason type
enum TxFinalizationReasonType {
  postConsensus('TX_FINALIZATION_REASON_POST_CONSENSUS'),
  preConsensus('TX_FINALIZATION_REASON_PRE_CONSENSUS'),
  unknown('UNRECOGNIZED');

  final String value;
  const TxFinalizationReasonType(this.value);

  factory TxFinalizationReasonType.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return unknown;
  }
}

/// Transaction message type from WebSocket
enum TxMsgType {
  addedToMempool('TX_ADDED_TO_MEMPOOL'),
  removedFromMempool('TX_REMOVED_FROM_MEMPOOL'),
  confirmed('TX_CONFIRMED'),
  finalized('TX_FINALIZED'),
  invalidated('TX_INVALIDATED'),
  unknown('UNRECOGNIZED');

  final String value;
  const TxMsgType(this.value);

  factory TxMsgType.from(String value) {
    for (var type in values) {
      if (type.value == value) return type;
    }
    return unknown;
  }
}

/// Token value attached to an input or output
@freezed
class Token with _$Token {
  /// Hex token ID (big-endian)
  @override
  final String tokenId;

  /// Token type (SLP or ALP)
  @override
  final Object tokenType; // SlpTokenType | AlpTokenType | UnknownTokenType

  /// Token amount in atoms (base tokens)
  @override
  final BigInt atoms;

  /// Whether this token is a mint baton
  @override
  final bool isMintBaton;

  /// Index into token_entries (only for txs, -1 for utxos, omitted in response)
  @override
  final int? entryIdx;

  Token({
    required this.tokenId,
    required this.tokenType,
    required this.atoms,
    required this.isMintBaton,
    this.entryIdx,
  });
}

/// Failed coloring report for a token
@freezed
class TokenFailedColoring with _$TokenFailedColoring {
  /// Index of the pushdata that failed
  @override
  final int pushdataIdx;

  /// Human-readable error message
  @override
  final String error;

  TokenFailedColoring({required this.pushdataIdx, required this.error});
}

/// Failed parsing report for a token
@freezed
class TokenFailedParsing with _$TokenFailedParsing {
  /// Index of the pushdata that failed (-1 if whole OP_RETURN failed)
  @override
  final int pushdataIdx;

  /// The bytes that failed parsing
  @override
  final String bytes;

  /// Human-readable error message
  @override
  final String error;

  TokenFailedParsing({
    required this.pushdataIdx,
    required this.bytes,
    required this.error,
  });
}

/// Token involved in a transaction
@freezed
class TokenEntry with _$TokenEntry {
  /// Hex token ID (big-endian)
  @override
  final String tokenId;

  /// Token type (SLP or ALP)
  @override
  final Object tokenType; // SlpTokenType | AlpTokenType | UnknownTokenType

  /// Transaction type (NONE, GENESIS, SEND, MINT, BURN)
  @override
  final TokenTxType txType;

  /// Group token ID (for NFT1 child tokens only)
  @override
  final String? groupTokenId;

  /// Whether validation rules were violated
  @override
  final bool isInvalid;

  /// Human-readable burn summary
  @override
  final String burnSummary;

  /// Human-readable error messages for failed colorings
  @override
  final List<TokenFailedColoring> failedColorings;

  /// Number of burned tokens (atoms)
  @override
  final BigInt actualBurnAtoms;

  /// User-explicitly opted-in burn amount (atoms)
  @override
  final BigInt intentionalBurnAtoms;

  /// Whether any mint batons were burned
  @override
  final bool burnsMintBatons;

  TokenEntry({
    required this.tokenId,
    required this.tokenType,
    required this.txType,
    required this.isInvalid,
    required this.burnSummary,
    required this.failedColorings,
    required this.actualBurnAtoms,
    required this.intentionalBurnAtoms,
    required this.burnsMintBatons,
    this.groupTokenId,
  });
}

/// Plugin data entry
@freezed
class PluginEntry with _$PluginEntry {
  /// Groups assigned to this output
  @override
  final List<String> groups;

  /// Data assigned to the output
  @override
  final List<String> data;

  PluginEntry({required this.groups, required this.data});
}

/// Plugin entries map
typedef PluginEntries = Map<String, PluginEntry>;

/// Block metadata
@freezed
class BlockMetadata with _$BlockMetadata {
  /// Block height
  @override
  final int height;

  /// Block hash (big-endian hex)
  @override
  final String hash;

  /// Block timestamp
  @override
  final int timestamp;

  BlockMetadata({
    required this.height,
    required this.hash,
    required this.timestamp,
  });
}

/// Transaction input
@freezed
class TxInput with _$TxInput {
  /// Previous output being spent
  @override
  final OutPoint prevOut;

  /// Input script (unlocking script)
  @override
  final String inputScript;

  /// Output script of the output being spent
  @override
  final String? outputScript;

  /// Value of the output being spent (satoshis)
  @override
  final BigInt sats;

  /// Sequence number
  @override
  final int sequenceNo;

  /// Token value attached to this input
  @override
  final Token? token;

  /// Plugin data attached to this input
  @override
  final PluginEntries? plugins;

  TxInput({
    required this.prevOut,
    required this.inputScript,
    required this.sats,
    required this.sequenceNo,
    this.outputScript,
    this.token,
    this.plugins,
  });
}

/// Transaction output
@freezed
class TxOutput with _$TxOutput {
  /// Output value (satoshis)
  @override
  final BigInt sats;

  /// Output script (locking script)
  @override
  final String outputScript;

  /// Output that spends this output
  @override
  final OutPoint? spentBy;

  /// Token value attached to this output
  @override
  final Token? token;

  /// Plugin data attached to this output
  @override
  final PluginEntries? plugins;

  TxOutput({
    required this.sats,
    required this.outputScript,
    this.spentBy,
    this.token,
    this.plugins,
  });
}

/// Unspent transaction output
@freezed
class ScriptUtxo with _$ScriptUtxo {
  /// Output reference
  @override
  final OutPoint outpoint;

  /// Block height (-1 if in mempool)
  @override
  final int blockHeight;

  /// Whether this is a coinbase UTXO
  @override
  final bool isCoinbase;

  /// Value in satoshis
  @override
  final BigInt sats;

  /// Whether finalized by Avalanche
  @override
  final bool isFinal;

  /// Token value attached to this UTXO
  @override
  final Token? token;

  /// Plugin data attached to this UTXO
  @override
  final PluginEntries? plugins;

  ScriptUtxo({
    required this.outpoint,
    required this.blockHeight,
    required this.isCoinbase,
    required this.sats,
    required this.isFinal,
    this.token,
    this.plugins,
  });
}

/// A complete transaction with all details
@freezed
class Tx with _$Tx {
  /// Transaction ID (big-endian hex)
  @override
  final String txid;

  /// Transaction version
  @override
  final int version;

  /// Transaction inputs
  @override
  final List<TxInput> inputs;

  /// Transaction outputs
  @override
  final List<TxOutput> outputs;

  /// Lock time
  @override
  final int lockTime;

  /// Block metadata (if confirmed)
  @override
  final BlockMetadata? block;

  /// Time first seen (UNIX timestamp)
  @override
  final int timeFirstSeen;

  /// Transaction size in bytes
  @override
  final int size;

  /// Whether this is a coinbase transaction
  @override
  final bool isCoinbase;

  /// Token entries in this transaction
  @override
  final List<TokenEntry> tokenEntries;

  /// Failed token parsing attempts
  @override
  final List<TokenFailedParsing> tokenFailedParsings;

  /// Token status
  @override
  final TokenStatus tokenStatus;

  /// Whether this transaction is finalized
  @override
  final bool isFinal;

  Tx({
    required this.txid,
    required this.version,
    required this.inputs,
    required this.outputs,
    required this.lockTime,
    required this.timeFirstSeen,
    required this.size,
    required this.isCoinbase,
    required this.tokenEntries,
    required this.tokenFailedParsings,
    required this.tokenStatus,
    required this.isFinal,
    this.block,
  });

  factory Tx.fromProto(pb.Tx proto) {
    return convertToTx(proto);
  }
}

@freezed
class RawTx with _$RawTx {
  @override
  final String rawTx;

  RawTx({required this.rawTx});

  factory RawTx.fromProto(pb.RawTx proto) => RawTx(rawTx: proto.rawTx.toHex());
}

@freezed
class Utxo with _$Utxo {
  /// Outpoint of the UTXO.
  @override
  final OutPoint outpoint;

  /// Which block this UTXO is in, or -1 if in the mempool.
  @override
  final int blockHeight;

  /// Whether this is a coinbase UTXO
  /// (make sure it's buried 100 blocks before spending!)
  @override
  final bool isCoinbase;

  /// Value of the UTXO in satoshis
  @override
  final Int64 sats;

  /// Bytecode of the script of the output
  @override
  final String script;

  /// Is this utxo avalanche finalized
  @override
  final bool isFinal;

  /// Token value attached to this utxo
  @override
  final Token? token;

  /// Plugin data attached to this output
  @override
  final PluginEntries? plugins;

  Utxo({
    required this.outpoint,
    required this.blockHeight,
    required this.isCoinbase,
    required this.sats,
    required this.script,
    required this.isFinal,
    this.token,
    this.plugins,
  });

  factory Utxo.fromProto(pb.Utxo proto) => convertToUtxo(proto);
}
