/// Main Chronik client class
library;

import 'dart:async';
import 'endpoints.dart';
import 'failover_proxy.dart';
import 'types.dart';
import 'utils.dart';
import 'ws_endpoint.dart';
import 'chronik.pb.dart' as pb;

/// Main client for accessing the Chronik indexer
class ChronikClient {
  final FailoverProxy _proxy;

  ChronikClient._(this._proxy);

  /// Create a Chronik client with the given list of server URLs
  factory ChronikClient(List<String> urls) {
    if (urls.isEmpty) {
      throw ValidationException('At least one server URL is required');
    }
    return ChronikClient._(FailoverProxy(urls));
  }

  /// Create a Chronik client using a connection strategy
  ///
  /// Supports two strategies:
  /// - [ConnectionStrategy.closestFirst]: Selects fastest server by WebSocket latency
  /// - [ConnectionStrategy.asOrdered]: Uses servers in provided order
  static Future<ChronikClient> useStrategy(
    ConnectionStrategy strategy,
    List<String> urls,
  ) async {
    if (urls.isEmpty) {
      throw ValidationException('At least one server URL is required');
    }

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
  Future<BlockchainInfoResponse> blockchainInfo() async {
    final data = await _proxy.get('/blockchain-info');
    final blockchainInfo = pb.BlockchainInfo()..mergeFromBuffer(data);
    return blockchainInfo;
  }

  /// Get Chronik server information
  Future<ChronikInfoResponse> chronikInfo() async {
    final data = await _proxy.get('/chronik-info');
    final chronikInfo = pb.ChronikInfo()..mergeFromBuffer(data);
    return chronikInfo;
  }

  // ============================================================================
  // Block Methods
  // ============================================================================

  /// Get a block by hash or height
  ///
  /// [hashOrHeight] can be:
  /// - Block hash as hex string (64 characters)
  /// - Block height as integer (as string)
  Future<BlockResponse> block(String hashOrHeight) async {
    if (hashOrHeight.isEmpty) {
      throw ValidationException('Hash or height cannot be empty');
    }

    final data = await _proxy.get('/block/$hashOrHeight');
    final block = pb.Block()..mergeFromBuffer(data);
    return block;
  }

  /// Get a range of blocks
  ///
  /// Returns blocks from [startHeight] to [endHeight] inclusive
  Future<List<pb.BlockInfo>> blocks(int startHeight, int endHeight) async {
    if (startHeight < 0 || endHeight < startHeight) {
      throw ValidationException('Invalid block height range');
    }

    final data = await _proxy.get('/blocks/$startHeight/$endHeight');
    final blocks = pb.Blocks()..mergeFromBuffer(data);
    return blocks.blocks.toList();
  }

  /// Get transactions in a block
  Future<BlockTxsResponse> blockTxs(
    String hashOrHeight, {
    int page = 0,
    int pageSize = 10,
  }) async {
    if (pageSize <= 0) {
      throw ValidationException('pageSize must be positive');
    }

    final data = await _proxy.get(
      '/block-txs/$hashOrHeight?page=$page&page_size=$pageSize',
    );

    final txsPage = pb.TxHistoryPage()..mergeFromBuffer(data);
    return BlockTxsResponse(page: page, pageSize: pageSize, txs: txsPage.txs);
  }

  // ============================================================================
  // Transaction Methods
  // ============================================================================

  /// Get transaction details by TXID
  Future<TxResponse> tx(String txid) async {
    if (!isValidTxId(txid)) {
      throw ValidationException('Invalid TXID: $txid');
    }

    final data = await _proxy.get('/tx/$txid');
    final tx = pb.Tx()..mergeFromBuffer(data);
    return tx;
  }

  /// Get raw transaction bytes
  Future<List<int>> rawTx(String txid) async {
    if (!isValidTxId(txid)) {
      throw ValidationException('Invalid TXID: $txid');
    }

    return await _proxy.get('/raw-tx/$txid');
  }

  /// Broadcast a single transaction
  Future<BroadcastResponse> broadcastTx(List<int> txBytes) async {
    if (txBytes.isEmpty) {
      throw ValidationException('Transaction bytes cannot be empty');
    }

    return _broadcastTxInternal(txBytes);
  }

  /// Broadcast multiple transactions
  Future<List<BroadcastResponse>> broadcastTxs(
    List<List<int>> txBytesList,
  ) async {
    if (txBytesList.isEmpty) {
      throw ValidationException('Transactions list cannot be empty');
    }

    final responses = <BroadcastResponse>[];
    for (final txBytes in txBytesList) {
      responses.add(await broadcastTx(txBytes));
    }
    return responses;
  }

  /// Broadcast a transaction and wait for finalization
  Future<BroadcastAndFinalizeResponse> broadcastAndFinalizeTx(
    List<int> txBytes,
  ) async {
    if (txBytes.isEmpty) {
      throw ValidationException('Transaction bytes cannot be empty');
    }

    final data = await _proxy.post('/broadcast-tx', txBytes);
    final response = pb.BroadcastTxResponse()..mergeFromBuffer(data);
    return BroadcastAndFinalizeResponse(txid: _bytesToHex(response.txid));
  }

  /// Broadcast multiple transactions and wait for finalization
  Future<List<BroadcastAndFinalizeResponse>> broadcastAndFinalizeTxs(
    List<List<int>> txBytesList,
  ) async {
    if (txBytesList.isEmpty) {
      throw ValidationException('Transactions list cannot be empty');
    }

    final responses = <BroadcastAndFinalizeResponse>[];
    for (final txBytes in txBytesList) {
      responses.add(await broadcastAndFinalizeTx(txBytes));
    }
    return responses;
  }

  /// Validate a raw transaction
  /// Returns null for valid transactions, or an error message for invalid ones
  Future<ValidateRawTxResponse?> validateRawTx(List<int> txBytes) async {
    if (txBytes.isEmpty) {
      throw ValidationException('Transaction bytes cannot be empty');
    }

    try {
      await _proxy.post('/validate-tx', txBytes);
      return null; // Valid transaction
    } on ChronikException catch (e) {
      return ValidateRawTxResponse(error: e.message);
    }
  }

  /// Get unconfirmed transactions from mempool
  Future<UnconfirmedTxsResponse> unconfirmedTxs() async {
    final data = await _proxy.get('/unconfirmed-txs');
    final txsPage = pb.TxHistoryPage()..mergeFromBuffer(data);
    return UnconfirmedTxsResponse(txs: txsPage.txs);
  }

  /// Internal method to broadcast a transaction
  Future<BroadcastResponse> _broadcastTxInternal(List<int> txBytes) async {
    final data = await _proxy.post('/broadcast-tx', txBytes);
    final response = pb.BroadcastTxResponse()..mergeFromBuffer(data);
    return BroadcastResponse(txid: _bytesToHex(response.txid));
  }

  /// Helper method to convert bytes to hex string
  String _bytesToHex(List<int> bytes) {
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  // ============================================================================
  // Token Methods
  // ============================================================================

  /// Get token information by token ID
  Future<TokenInfoResponse> token(String tokenId) async {
    if (!isValidTokenId(tokenId)) {
      throw ValidationException('Invalid token ID: $tokenId');
    }

    final data = await _proxy.get('/token/$tokenId');
    final tokenInfo = pb.TokenInfo()..mergeFromBuffer(data);
    return tokenInfo;
  }

  /// Get token ID endpoint for querying token-specific data
  TokenIdEndpoint tokenId(String tokenId) {
    if (!isValidTokenId(tokenId)) {
      throw ValidationException('Invalid token ID: $tokenId');
    }

    return TokenIdEndpoint(_proxy, tokenId: tokenId);
  }

  // ============================================================================
  // Script/Address Methods
  // ============================================================================

  /// Get script endpoint for querying script-specific data
  ScriptEndpoint script(String scriptType, String scriptPayload) {
    return ScriptEndpoint(
      _proxy,
      scriptType: normalizeScriptType(scriptType),
      scriptPayload: scriptPayload,
    );
  }

  /// Get script endpoint for an eCash address
  ScriptEndpoint address(String address) {
    // TODO: Add address validation and conversion logic here
    // For now, treat it as a p2pkh script
    return ScriptEndpoint(
      _proxy,
      scriptType: 'address',
      scriptPayload: address,
    );
  }

  // ============================================================================
  // Lokad ID Methods
  // ============================================================================

  /// Get lokad ID endpoint for querying lokad-specific data
  LokadIdEndpoint lokadId(String lokadId) {
    if (!isValidLokadId(lokadId)) {
      throw ValidationException('Invalid lokad ID: $lokadId');
    }

    return LokadIdEndpoint(_proxy, lokadId: lokadId);
  }

  // ============================================================================
  // Plugin Methods
  // ============================================================================

  /// Get plugin endpoint for querying plugin-specific data
  PluginEndpoint plugin(String pluginName) {
    if (pluginName.isEmpty) {
      throw ValidationException('Plugin name cannot be empty');
    }

    return PluginEndpoint(_proxy, pluginName: pluginName);
  }

  // ============================================================================
  // WebSocket Methods
  // ============================================================================

  /// Create and configure a WebSocket endpoint
  WsEndpoint ws(WsConfig config) {
    final urls = _proxy.getUrls();
    final wsUrls = urls
        .map((url) => url.replaceFirst(RegExp(r'^https?://'), 'wss://'))
        .toList();

    return WsEndpoint(urls: wsUrls, config: config);
  }

  // ============================================================================
  // Cleanup
  // ============================================================================

  /// Close the client and clean up resources
  void close() {
    _proxy.close();
  }
}
