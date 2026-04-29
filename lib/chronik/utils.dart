import 'dart:async';
import 'dart:convert';
import 'package:ecash/ecash.dart';
import 'package:http/http.dart' as http;
import 'types.dart' as types;
import 'chronik.pb.dart' as pb;

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
  final results = await Future.wait(
    urls.map((url) async {
      final latency = await measureWebsocketLatency(url);
      return (url: url, latency: latency);
    }),
  );

  results.sort((a, b) => a.latency.compareTo(b.latency));
  return results.map((r) => r.url).toList();
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
String bytesToHex(Iterable<int> bytes) {
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

extension BytesExtension on Iterable<int> {
  String toHex() => bytesToHex(this);
}

types.BlockchainInfo convertToBlockchainInfo(pb.BlockchainInfo pbInfo) {
  return types.BlockchainInfo(
    tipHash: pbInfo.tipHash.reversed.toHex(),
    tipHeight: pbInfo.tipHeight,
  );
}

types.ChronikInfo convertToChronikInfo(pb.ChronikInfo chronikInfo) {
  if (chronikInfo.hasVersion()) {
    return types.ChronikInfo(version: chronikInfo.version);
  }
  throw Exception('chronikInfo has no version');
}

types.Block convertToBlock(pb.Block pbBlock) {
  return types.Block(blockInfo: convertToBlockInfo(pbBlock.blockInfo));
}

types.BlockInfo convertToBlockInfo(pb.BlockInfo pbBlockInfo) {
  return types.BlockInfo(
    hash: pbBlockInfo.hash.reversed.toHex(),
    prevHash: pbBlockInfo.prevHash.reversed.toHex(),
    height: pbBlockInfo.height,
    nBits: pbBlockInfo.nBits,
    timestamp: pbBlockInfo.timestamp.toInt(),
    isFinal: pbBlockInfo.isFinal,
    blockSize: pbBlockInfo.blockSize.toInt(),
    numTxs: pbBlockInfo.numTxs.toInt(),
    numInputs: pbBlockInfo.numInputs.toInt(),
    numOutputs: pbBlockInfo.numOutputs.toInt(),
    sumInputSats: pbBlockInfo.sumInputSats.toInt(),
    sumCoinbaseOutputSats: pbBlockInfo.sumCoinbaseOutputSats.toInt(),
    sumNormalOutputSats: pbBlockInfo.sumNormalOutputSats.toInt(),
    sumBurnedSats: pbBlockInfo.sumBurnedSats.toInt(),
  );
}

// ============================================================================
// Transaction Conversion Functions
// ============================================================================

/// Convert a protocol buffer Tx to a user-friendly Tx object
types.Tx convertToTx(pb.Tx pbTx) {
  types.BlockMetadata? blockMetadata;
  if (pbTx.hasBlock()) {
    blockMetadata = _convertToBlockMetadata(pbTx.block);
  }

  return types.Tx(
    txid: pbTx.txid.reversed.toHex(),
    version: pbTx.version,
    inputs: pbTx.inputs.map(_convertToTxInput).toList(),
    outputs: pbTx.outputs.map(_convertToTxOutput).toList(),
    lockTime: pbTx.lockTime,
    block: blockMetadata,
    timeFirstSeen: pbTx.timeFirstSeen.toInt(),
    size: pbTx.size,
    isCoinbase: pbTx.isCoinbase,
    tokenEntries: pbTx.tokenEntries.map(_convertToTokenEntry).toList(),
    tokenFailedParsings: pbTx.tokenFailedParsings
        .map(_convertToTokenFailedParsing)
        .toList(),
    tokenStatus: _convertToTokenStatus(pbTx.tokenStatus),
    isFinal: pbTx.isFinal,
  );
}

/// Convert a protocol buffer TxInput to a user-friendly TxInput object
types.TxInput _convertToTxInput(pb.TxInput pbInput) {
  types.Token? token;
  if (pbInput.hasToken()) {
    token = _convertToToken(pbInput.token);
  }

  types.PluginEntries? plugins;
  if (pbInput.plugins.isNotEmpty) {
    plugins = _convertToPluginEntries(pbInput.plugins);
  }

  String? outputScript;
  if (pbInput.outputScript.isNotEmpty) {
    outputScript = pbInput.outputScript.toHex();
  }

  return types.TxInput(
    prevOut: types.OutPoint(
      txid: pbInput.prevOut.txid.reversed.toHex(),
      outIdx: pbInput.prevOut.outIdx,
    ),
    inputScript: pbInput.inputScript.toHex(),
    outputScript: outputScript,
    sats: BigInt.from(pbInput.sats.toInt()),
    sequenceNo: pbInput.sequenceNo,
    token: token,
    plugins: plugins,
  );
}

/// Convert a protocol buffer TxOutput to a user-friendly TxOutput object
types.TxOutput _convertToTxOutput(pb.TxOutput pbOutput) {
  types.OutPoint? spentBy;
  if (pbOutput.hasSpentBy()) {
    spentBy = types.OutPoint(
      txid: pbOutput.spentBy.txid.reversed.toHex(),
      outIdx: pbOutput.spentBy.inputIdx,
    );
  }

  types.Token? token;
  if (pbOutput.hasToken()) {
    token = _convertToToken(pbOutput.token);
  }

  types.PluginEntries? plugins;
  if (pbOutput.plugins.isNotEmpty) {
    plugins = _convertToPluginEntries(pbOutput.plugins);
  }

  return types.TxOutput(
    sats: BigInt.from(pbOutput.sats.toInt()),
    outputScript: pbOutput.outputScript.toHex(),
    spentBy: spentBy,
    token: token,
    plugins: plugins,
  );
}

/// Convert a protocol buffer BlockMetadata to a user-friendly BlockMetadata object
types.BlockMetadata _convertToBlockMetadata(pb.BlockMetadata pbBlock) {
  return types.BlockMetadata(
    height: pbBlock.height,
    hash: pbBlock.hash.reversed.toHex(),
    timestamp: pbBlock.timestamp.toInt(),
  );
}

/// Convert a protocol buffer TokenEntry to a user-friendly TokenEntry object
types.TokenEntry _convertToTokenEntry(pb.TokenEntry pbTokenEntry) {
  final tokenType = _convertToTokenType(pbTokenEntry.tokenType);

  return types.TokenEntry(
    tokenId: pbTokenEntry.tokenId,
    tokenType: tokenType,
    txType: _convertToTokenTxType(pbTokenEntry.txType),
    groupTokenId: pbTokenEntry.groupTokenId.isNotEmpty
        ? pbTokenEntry.groupTokenId
        : null,
    isInvalid: pbTokenEntry.isInvalid,
    burnSummary: pbTokenEntry.burnSummary,
    failedColorings: pbTokenEntry.failedColorings
        .map(_convertToTokenFailedColoring)
        .toList(),
    actualBurnAtoms: BigInt.parse(pbTokenEntry.actualBurnAtoms),
    intentionalBurnAtoms: BigInt.parse(
      pbTokenEntry.intentionalBurnAtoms.toString(),
    ),
    burnsMintBatons: pbTokenEntry.burnsMintBatons,
  );
}

/// Convert a protocol buffer TokenFailedParsing to a user-friendly TokenFailedParsing object
types.TokenFailedParsing _convertToTokenFailedParsing(
  pb.TokenFailedParsing pbParsing,
) {
  return types.TokenFailedParsing(
    pushdataIdx: pbParsing.pushdataIdx,
    bytes: pbParsing.bytes.toHex(),
    error: pbParsing.error,
  );
}

/// Convert a protocol buffer TokenFailedColoring to a user-friendly TokenFailedColoring object
types.TokenFailedColoring _convertToTokenFailedColoring(
  pb.TokenFailedColoring pbColoring,
) {
  return types.TokenFailedColoring(
    pushdataIdx: pbColoring.pushdataIdx,
    error: pbColoring.error,
  );
}

/// Convert a protocol buffer TokenType to a user-friendly TokenType object
TokenType _convertToTokenType(pb.TokenType pbTokenType) {
  if (pbTokenType.hasAlp()) {
    final alpType = pbTokenType.alp;
    return types.AlpTokenType(
      type: types.AlpTokenTypeValue.from(alpType.name),
      number: alpType.value,
    );
  }

  if (pbTokenType.hasSlp()) {
    final slpType = pbTokenType.slp;
    return types.SlpTokenType(
      type: types.SlpTokenTypeValue.from(slpType.name),
      number: slpType.value,
    );
  }

  // Unknown token type
  return types.UnknownTokenType();
}

/// Convert a protocol buffer TokenTxType to a user-friendly TokenTxType enum
types.TokenTxType _convertToTokenTxType(pb.TokenTxType pbTokenTxType) {
  return types.TokenTxType.from(pbTokenTxType.name);
}

/// Convert a protocol buffer TokenStatus to a user-friendly TokenStatus enum
types.TokenStatus _convertToTokenStatus(pb.TokenStatus pbTokenStatus) {
  return types.TokenStatus.from(pbTokenStatus.name);
}

/// Convert a protocol buffer Token to a user-friendly Token object
types.Token _convertToToken(pb.Token pbToken) {
  final tokenType = _convertToTokenType(pbToken.tokenType);

  return types.Token(
    tokenId: pbToken.tokenId,
    tokenType: tokenType,
    atoms: BigInt.from(pbToken.atoms.toInt()),
    isMintBaton: pbToken.isMintBaton,
    entryIdx: pbToken.entryIdx != -1 ? pbToken.entryIdx : null,
  );
}

/// Convert a protocol buffer PluginEntries map to a user-friendly PluginEntries object
types.PluginEntries _convertToPluginEntries(
  Map<String, pb.PluginEntry> pbPlugins,
) {
  final result = <String, types.PluginEntry>{};
  for (final entry in pbPlugins.entries) {
    result[entry.key] = types.PluginEntry(
      groups: entry.value.groups.map(bytesToHex).toList(),
      data: entry.value.data.map(bytesToHex).toList(),
    );
  }
  return result;
}

types.TokenInfo convertToTokenInfo(pb.TokenInfo tokenInfo) {
  if (!tokenInfo.hasTokenType()) {
    throw Exception(
      'chronik returned undefined tokenInfo.tokenType for tokenId "${tokenInfo.tokenId}',
    );
  }

  if (!tokenInfo.hasGenesisInfo()) {
    throw Exception(
      'chronik returned undefined tokenInfo.genesisInfo for tokenId "${tokenInfo.tokenId}',
    );
  }

  final tokenType = _convertToTokenType(tokenInfo.tokenType);

  return types.TokenInfo(
    tokenId: tokenInfo.tokenId,
    tokenType: tokenType,
    timeFirstSeen: tokenInfo.timeFirstSeen.toInt(),
    genesisInfo: convertToGenesisInfo(tokenInfo.genesisInfo, tokenType),
    block: tokenInfo.hasBlock()
        ? _convertToBlockMetadata(tokenInfo.block)
        : null,
  );
}

types.GenesisInfo convertToGenesisInfo(
  pb.GenesisInfo genesisInfo,
  TokenType tokenType,
) {
  final decoder = Utf8Decoder();
  final returnedGenesisInfo = types.GenesisInfo(
    tokenTicker: decoder.convert(genesisInfo.tokenTicker),
    tokenName: decoder.convert(genesisInfo.tokenName),
    url: decoder.convert(genesisInfo.url),
    decimals: genesisInfo.decimals,
  );

  return switch (tokenType) {
    AlpTokenType _ => returnedGenesisInfo.copyWith(
      data: genesisInfo.data.toHex(),
      authPubKey: genesisInfo.authPubkey.toHex(),
    ),
    SlpTokenType slp when slp.type == SlpTokenTypeValue.mintVault =>
      returnedGenesisInfo.copyWith(
        mintVaultScripthash: genesisInfo.mintVaultScripthash.toHex(),
        hash: genesisInfo.hash.toHex(),
      ),
    SlpTokenType _ => returnedGenesisInfo.copyWith(
      hash: genesisInfo.hash.toHex(),
    ),
    _ => returnedGenesisInfo,
  };
}

types.Utxo convertToUtxo(pb.Utxo utxo) {
  if (!utxo.hasOutpoint()) throw ArgumentError('UTXO outpoint is undefined');
  return types.Utxo(
    outpoint: types.OutPoint(
      txid: utxo.outpoint.txid.reversed.toHex(),
      outIdx: utxo.outpoint.outIdx,
    ),
    blockHeight: utxo.blockHeight,
    isCoinbase: utxo.isCoinbase,
    sats: utxo.sats,
    script: utxo.script.toHex(),
    isFinal: utxo.isFinal,
    token: utxo.hasToken() ? _convertToToken(utxo.token) : null,
    plugins: utxo.plugins.isNotEmpty
        ? _convertToPluginEntries(utxo.plugins)
        : null,
  );
}
