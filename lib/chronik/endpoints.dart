import 'dart:async';
import 'package:ecash/chronik/utils.dart';
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
    super.proxy, {
    required this.scriptType,
    required this.scriptPayload,
  });

  /// Get transaction history for this script
  Future<TxHistoryPage> history({int page = 0, int pageSize = 10}) async {
    if (pageSize <= 0) throw ValidationException('pageSize must be positive');

    final data = await proxy.get(
      '/script/$scriptType/$scriptPayload/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
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
      txs: historyPage.txs.map(Tx.fromProto).toList(),
    );
  }

  /// Get unconfirmed transactions for this script
  Future<TxHistoryPage> unconfirmedTxs() async {
    final data = await proxy.get(
      '/script/$scriptType/$scriptPayload/unconfirmed-txs',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get UTXOs for this script
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/script/$scriptType/$scriptPayload/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos.map(Utxo.fromProto).toList());
  }
}

// ============================================================================
// TokenIdEndpoint
// ============================================================================

/// Endpoint for querying token ID data
class TokenIdEndpoint extends QueryEndpoint {
  final String tokenId;

  TokenIdEndpoint(super.proxy, {required this.tokenId});

  /// Get transaction history for this token
  Future<TxHistoryPage> history({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/token-id/$tokenId/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get confirmed transactions for this token
  Future<TxHistoryPage> confirmedTxs({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/token-id/$tokenId/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get unconfirmed transactions for this token
  Future<TxHistoryPage> unconfirmedTxs() async {
    final data = await proxy.get('/token-id/$tokenId/unconfirmed-txs');

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get UTXOs for this token
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/token-id/$tokenId/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos.map(Utxo.fromProto).toList());
  }
}

// ============================================================================
// LokadIdEndpoint
// ============================================================================

/// Endpoint for querying lokad ID data
class LokadIdEndpoint extends QueryEndpoint {
  final String lokadId;

  LokadIdEndpoint(super.proxy, {required this.lokadId});

  /// Get transaction history for this lokad ID
  Future<TxHistoryPage> history({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/lokad-id/$lokadId/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get confirmed transactions for this lokad ID
  Future<TxHistoryPage> confirmedTxs({int page = 0, int pageSize = 10}) async {
    final data = await proxy.get(
      '/lokad-id/$lokadId/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get unconfirmed transactions for this lokad ID
  Future<TxHistoryPage> unconfirmedTxs() async {
    final data = await proxy.get('/lokad-id/$lokadId/unconfirmed-txs');

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get UTXOs for this lokad ID
  Future<UtxosResponse> utxos() async {
    final data = await proxy.get('/lokad-id/$lokadId/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos.map(Utxo.fromProto).toList());
  }
}

// ============================================================================
// PluginEndpoint
// ============================================================================

/// Endpoint for querying plugin data
class PluginEndpoint extends QueryEndpoint {
  final String pluginName;

  PluginEndpoint(super.proxy, {required this.pluginName});

  /// Get UTXOs for a plugin group
  Future<UtxosResponse> utxos(String groupHex) async {
    final data = await proxy.get('/plugin/$pluginName/$groupHex/utxos');

    final utxosData = _decodeProto(data, () => pb.Utxos());
    return UtxosResponse(utxos: utxosData.utxos.map(Utxo.fromProto).toList());
  }

  /// Get transaction history for a plugin group
  Future<TxHistoryPage> history(
    String groupHex, {
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/history?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get confirmed transactions for a plugin group
  Future<TxHistoryPage> confirmedTxs(
    String groupHex, {
    int page = 0,
    int pageSize = 10,
  }) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/confirmed-txs?page=$page&page_size=$pageSize',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get unconfirmed transactions for a plugin group
  Future<TxHistoryPage> unconfirmedTxs(String groupHex) async {
    final data = await proxy.get(
      '/plugin/$pluginName/$groupHex/unconfirmed-txs',
    );

    final historyPage = _decodeProto(data, () => pb.TxHistoryPage());
    return TxHistoryPage.fromProto(historyPage);
  }

  /// Get all groups for this plugin
  Future<PluginGroups> groups({
    String? prefixHex,
    String? startHex,
    int? pageSize,
  }) async {
    final queryParams = <String>[
      if (prefixHex != null) 'prefix=$prefixHex',
      if (startHex != null) 'start=$startHex',
      if (pageSize != null) 'page_size=$pageSize',
    ];
    final data = await proxy.get(
      '/plugin/$pluginName/groups?${queryParams.join('&')}',
    );

    final groupsResponse = _decodeProto(data, () => pb.PluginGroups());
    return PluginGroups(
      groups: groupsResponse.groups.map(PluginGroup.fromProto).toList(),
      nextStart: groupsResponse.nextStart.toHex(),
    );
  }
}
