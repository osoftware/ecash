/// Main Chronik client class
library;

import 'dart:async';
import 'dart:typed_data';
import 'package:fixnum/fixnum.dart';

import '../ecashaddr/cashaddr.dart';
import 'endpoints.dart';
import 'failover_proxy.dart';
import 'types.dart';
import 'utils.dart';
import 'ws_endpoint.dart';
import 'chronik.pb.dart' as pb;

/// Main client for accessing the Chronik indexer
class ChronikClient {
  final FailoverProxy _proxyInterface;

  ChronikClient._(this._proxyInterface);

  /// Create a Chronik client with the given list of server URLs
  factory ChronikClient(List<String> urls) {
    if (urls.isEmpty) {
      throw ValidationException('At least one server URL is required');
    }
    return ChronikClient._(FailoverProxy(urls));
  }

  /// Create Chronik client instance with specified [ConnectionStrategy]
  static Future<ChronikClient> useStrategy(
    ConnectionStrategy strategy,
    List<String> urls,
  ) async {
    final sortedUrls = switch (strategy) {
      ConnectionStrategy.closestFirst => await sortNodesByLatency(urls),
      ConnectionStrategy.asOrdered => urls,
    };

    return ChronikClient(sortedUrls);
  }

  // ============================================================================
  // Blockchain Info Methods
  // ============================================================================

  /// Get current blockchain information
  Future<BlockchainInfo> blockchainInfo() async {
    final data = await _proxyInterface.get('/blockchain-info');
    final blockchainInfo = pb.BlockchainInfo.fromBuffer(data);
    return convertToBlockchainInfo(blockchainInfo);
  }

  /// Get Chronik server information
  Future<ChronikInfo> chronikInfo() async {
    final data = await _proxyInterface.get('/chronik-info');
    final chronikInfo = pb.ChronikInfo.fromBuffer(data);
    return convertToChronikInfo(chronikInfo);
  }

  // ============================================================================
  // Block Methods
  // ============================================================================

  /// Get a block by hash or height
  ///
  /// [hashOrHeight] can be:
  /// - Block hash as hex string (64 characters)
  /// - Block height as integer (as string)
  Future<Block> block(String hashOrHeight) async {
    if (hashOrHeight.isEmpty) {
      throw ValidationException('Hash or height cannot be empty');
    }

    final data = await _proxyInterface.get('/block/$hashOrHeight');
    final block = pb.Block.fromBuffer(data);
    return Block.fromProto(block);
  }

  /// Get a range of blocks
  ///
  /// Returns blocks from [startHeight] to [endHeight] inclusive
  Future<List<BlockInfo>> blocks(int startHeight, int endHeight) async {
    final data = await _proxyInterface.get('/blocks/$startHeight/$endHeight');
    final blocks = pb.Blocks.fromBuffer(data);
    return blocks.blocks.map(BlockInfo.fromProto).toList();
  }

  /// Get transactions in a block
  Future<TxHistoryPage> blockTxs(
    String hashOrHeight, {
    int page = 0,
    int pageSize = 25,
  }) async {
    final data = await _proxyInterface.get(
      '/block-txs/$hashOrHeight?page=$page&page_size=$pageSize',
    );

    final txsPage = pb.TxHistoryPage.fromBuffer(data);
    return TxHistoryPage.fromProto(txsPage);
  }

  // ============================================================================
  // Transaction Methods
  // ============================================================================

  /// Get transaction details by TXID
  Future<Tx> tx(String txid) async {
    final data = await _proxyInterface.get('/tx/$txid');
    final tx = pb.Tx.fromBuffer(data);
    return Tx.fromProto(tx);
  }

  /// Get raw transaction bytes
  Future<RawTx> rawTx(String txid) async {
    final data = await _proxyInterface.get('/raw-tx/$txid');
    final rawTx = pb.RawTx.fromBuffer(data);
    return RawTx.fromProto(rawTx);
  }

  /// Broadcast a single transaction
  Future<BroadcastResponse> broadcastTx(Uint8List rawTx) async =>
      _broadcastTxRequest(rawTx);

  /// Broadcast multiple transactions
  Future<BroadcastTxsResponse> broadcastTxs(List<Uint8List> rawTxs) async =>
      _broadcastTxsRequest(rawTxs);

  /// Broadcast a transaction and wait for finalization
  Future<BroadcastResponse> broadcastAndFinalizeTx(
    Uint8List rawTx, {
    finalizationTimeout = const Duration(minutes: 2),
    skipTokenChecks = false,
  }) async {
    if (finalizationTimeout <= Duration.zero) {
      throw ValidationException(
        'Use broadcastTx if you do not want to wait for finalization.',
      );
    }
    return await _broadcastTxRequest(
      rawTx,
      finalizationTimeout: finalizationTimeout,
      skipTokenChecks: skipTokenChecks,
    );
  }

  /// Broadcast multiple transactions and wait for finalization
  Future<BroadcastTxsResponse> broadcastAndFinalizeTxs(
    List<Uint8List> rawTxs, {
    finalizationTimeout = const Duration(minutes: 2),
    skipTokenChecks = false,
  }) async {
    if (finalizationTimeout <= Duration.zero) {
      throw ValidationException(
        'Use broadcastTxs if you do not want to wait for finalization.',
      );
    }
    return await _broadcastTxsRequest(
      rawTxs,
      finalizationTimeout: finalizationTimeout,
      skipTokenChecks: skipTokenChecks,
    );
  }

  /// Validate a raw transaction
  /// Returns null for valid transactions, or an error message for invalid ones
  Future<Tx> validateRawTx(Uint8List rawTx) async {
    final request = pb.RawTx()..rawTx = rawTx;
    final data = await _proxyInterface.post(
      '/validate-tx',
      request.writeToBuffer(),
    );
    final response = pb.Tx.fromBuffer(data);
    return Tx.fromProto(response);
  }

  /// Get unconfirmed transactions from mempool
  Future<TxHistoryPage> unconfirmedTxs() async {
    final data = await _proxyInterface.get('/unconfirmed-txs');
    final txsPage = pb.TxHistoryPage.fromBuffer(data);
    return TxHistoryPage.fromProto(txsPage);
  }

  /// Internal method to broadcast a transaction
  Future<BroadcastResponse> _broadcastTxRequest(
    Uint8List rawTx, {
    Duration finalizationTimeout = Duration.zero,
    bool skipTokenChecks = false,
  }) async {
    final request = pb.BroadcastTxRequest.create()
      ..rawTx = rawTx
      ..skipTokenChecks = skipTokenChecks
      ..finalizationTimeoutSecs = Int64(finalizationTimeout.inSeconds);

    final data = await _proxyInterface.post(
      '/broadcast-tx',
      request.writeToBuffer(),
    );
    final response = pb.BroadcastTxResponse.fromBuffer(data);
    return BroadcastResponse(txid: response.txid.toHex());
  }

  /// Internal method to broadcast a transaction
  Future<BroadcastTxsResponse> _broadcastTxsRequest(
    List<Uint8List> rawTxs, {
    Duration finalizationTimeout = Duration.zero,
    bool skipTokenChecks = false,
  }) async {
    final request = pb.BroadcastTxsRequest.create()
      ..rawTxs.addAll(rawTxs)
      ..skipTokenChecks = skipTokenChecks
      ..finalizationTimeoutSecs = Int64(finalizationTimeout.inSeconds);

    final data = await _proxyInterface.post(
      '/broadcast-tx',
      request.writeToBuffer(),
    );
    final response = pb.BroadcastTxsResponse.fromBuffer(data);
    return BroadcastTxsResponse(
      txids: response.txids.map((t) => t.reversed.toHex()).toList(),
    );
  }

  // ============================================================================
  // Token Methods
  // ============================================================================

  /// Get token information by token ID
  Future<TokenInfo> token(String tokenId) async {
    final data = await _proxyInterface.get('/token/$tokenId');
    final tokenInfo = pb.TokenInfo.fromBuffer(data);
    return TokenInfo.fromProto(tokenInfo);
  }

  /// Get token ID endpoint for querying token-specific data
  TokenIdEndpoint tokenId(String tokenId) {
    return TokenIdEndpoint(_proxyInterface, tokenId: tokenId);
  }

  // ============================================================================
  // Script/Address Methods
  // ============================================================================

  /// Get script endpoint for querying script-specific data
  ScriptEndpoint script(String scriptType, String scriptPayload) {
    return ScriptEndpoint(
      _proxyInterface,
      scriptType: normalizeScriptType(scriptType),
      scriptPayload: scriptPayload,
    );
  }

  /// Get script endpoint for an eCash address
  ScriptEndpoint address(String address) {
    final addr = decodeCashAddress(address);
    return ScriptEndpoint(
      _proxyInterface,
      scriptType: addr.type,
      scriptPayload: addr.hash,
    );
  }

  // ============================================================================
  // Lokad ID Methods
  // ============================================================================

  /// Get lokad ID endpoint for querying lokad-specific data
  LokadIdEndpoint lokadId(String lokadId) =>
      LokadIdEndpoint(_proxyInterface, lokadId: lokadId);

  // ============================================================================
  // Plugin Methods
  // ============================================================================

  /// Get plugin endpoint for querying plugin-specific data
  PluginEndpoint plugin(String pluginName) =>
      PluginEndpoint(_proxyInterface, pluginName: pluginName);

  // ============================================================================
  // WebSocket Methods
  // ============================================================================

  /// Create and configure a WebSocket endpoint
  WsEndpoint ws(WsConfig config) => WsEndpoint(_proxyInterface, config: config);

  // ============================================================================
  // Cleanup
  // ============================================================================

  /// Close the client and clean up resources
  void close() {
    _proxyInterface.close();
  }
}
