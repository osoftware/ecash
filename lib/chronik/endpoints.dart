/// Query endpoint classes for Chronik client
library;

import 'dart:async';
import 'package:protobuf/protobuf.dart';
import 'failover_proxy.dart';
import 'types.dart';
import 'chronik.pb.dart' as pb;

// ============================================================================
// Base Endpoint
// ============================================================================

/// Base class for all query endpoints
abstract class QueryEndpoint {
  final FailoverProxy proxy;

  QueryEndpoint(this.proxy);

  /// Decode protobuf data with error handling
  T _decodeProto<T extends GeneratedMessage>(
    List<int> data,
    T Function() createEmpty,
  ) {
    try {
      return createEmpty()..mergeFromBuffer(data);
    } catch (e) {
      throw ChronikException(
        'Failed to decode protobuf response',
        originalError: e,
      );
    }
  }
}

// ============================================================================
// ScriptEndpoint
// ============================================================================

/// Endpoint for querying script/address data
class ScriptEndpoint extends QueryEndpoint {
  final String scriptType;
  final String scriptPayload;

  ScriptEndpoint(
    FailoverProxy proxy, {
    required this.scriptType,
    required this.scriptPayload,
  }) : super(proxy);

  /// Get transaction history for this script
  Future<HistoryResponse> history({int page = 0, int pageSize = 10}) async {
    if (pageSize <= 0) throw ValidationException('pageSize must be positive');

    final data = await proxy.get(
      '/script/$scriptType/$scriptPayload/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return HistoryResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get confirmed transactions for this script
  Future<ConfirmedTxsResponse> confirmedTxs({
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/script/$scriptType/$scriptPayload/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return ConfirmedTxsResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get unconfirmed transactions for this script
  Future<UnconfirmedTxsResponse> unconfirmedTxs() async {
    final data = await proxy.get(
      '/script/$scriptType/$scriptPayload/unconfirmed-txs',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return UnconfirmedTxsResponse(txs: historyPage.txs);
  }

  /// Get UTXOs for this script
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/script/$scriptType/$scriptPayload/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos);
  }
}

// ============================================================================
// TokenIdEndpoint
// ============================================================================

/// Endpoint for querying token ID data
class TokenIdEndpoint extends QueryEndpoint {
  final String tokenId;

  TokenIdEndpoint(FailoverProxy proxy, {required this.tokenId}) : super(proxy);

  /// Get transaction history for this token
  Future<HistoryResponse> history({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/token-id/$tokenId/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return HistoryResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get confirmed transactions for this token
  Future<ConfirmedTxsResponse> confirmedTxs({
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/token-id/$tokenId/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return ConfirmedTxsResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get unconfirmed transactions for this token
  Future<UnconfirmedTxsResponse> unconfirmedTxs() async {
    final data = await proxy.get('/token-id/$tokenId/unconfirmed-txs');

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return UnconfirmedTxsResponse(txs: historyPage.txs);
  }

  /// Get UTXOs for this token
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/token-id/$tokenId/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos);
  }
}

// ============================================================================
// LokadIdEndpoint
// ============================================================================

/// Endpoint for querying lokad ID data
class LokadIdEndpoint extends QueryEndpoint {
  final String lokadId;

  LokadIdEndpoint(FailoverProxy proxy, {required this.lokadId}) : super(proxy);

  /// Get transaction history for this lokad ID
  Future<HistoryResponse> history({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/lokad-id/$lokadId/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return HistoryResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get confirmed transactions for this lokad ID
  Future<ConfirmedTxsResponse> confirmedTxs({
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/lokad-id/$lokadId/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return ConfirmedTxsResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get unconfirmed transactions for this lokad ID
  Future<UnconfirmedTxsResponse> unconfirmedTxs() async {
    final data = await proxy.get('/lokad-id/$lokadId/unconfirmed-txs');

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return UnconfirmedTxsResponse(txs: historyPage.txs);
  }

  /// Get UTXOs for this lokad ID
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/lokad-id/$lokadId/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos);
  }
}

// ============================================================================
// PluginEndpoint
// ============================================================================

/// Endpoint for querying plugin data
class PluginEndpoint extends QueryEndpoint {
  final String pluginName;

  PluginEndpoint(FailoverProxy proxy, {required this.pluginName})
    : super(proxy);

  /// Get UTXOs for a plugin group
  Future<UtxosResponse> utxos(String groupHex) async {
    final data = await proxy.get('/plugin/$pluginName/$groupHex/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos);
  }

  /// Get transaction history for a plugin group
  Future<HistoryResponse> history(
    String groupHex, {
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return HistoryResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get confirmed transactions for a plugin group
  Future<ConfirmedTxsResponse> confirmedTxs(
    String groupHex, {
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return ConfirmedTxsResponse(
      page: page,
      pageSize: pageSize,
      txs: historyPage.txs,
    );
  }

  /// Get unconfirmed transactions for a plugin group
  Future<UnconfirmedTxsResponse> unconfirmedTxs(String groupHex) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/unconfirmed-txs',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return UnconfirmedTxsResponse(txs: historyPage.txs);
  }

  /// Get all groups for this plugin
  Future<GroupsResponse> groups() async {
    final data = await proxy.get('/plugin/$pluginName/groups');

    final groupsResponse = _decodeProto(data, () => pb.PluginGroups());
    return GroupsResponse(groups: groupsResponse.groups);
  }
}
