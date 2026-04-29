import 'types.dart';

final _validHexRegex = RegExp(r'^[a-f0-9]+$');
final _validLokadIdRegex = RegExp(r'^[a-f0-9]{8}$');
final _validTxidRegex = RegExp(r'^[a-f0-9]{64}$');

/// Validate a WebSocket subscription to a script/address
///
/// Returns true if valid, or an error message string if invalid
dynamic isValidWsSubscription(WsSubScriptClient subscription) {
  final scriptType = subscription.scriptType;
  final payload = subscription.payload;

  // Test for odd length
  if (payload.length % 2 != 0) {
    return 'Odd hex length: $payload';
  }

  // Test for valid hex
  if (!_validHexRegex.hasMatch(payload)) {
    return 'Invalid hex: "$payload". Payload must be lowercase hex string.';
  }

  // 20 bytes
  const supportedHashBytesP2pkhP2sh = 20;
  const supportedHashBytesP2pk = [33, 65];
  final payloadBytes = payload.length ~/ 2;

  switch (scriptType) {
    case 'p2pkh':
    case 'p2sh':
      // Test for length
      if (payloadBytes != supportedHashBytesP2pkhP2sh) {
        return 'Invalid length, expected 20 bytes but got $payloadBytes bytes';
      }
      return true;

    case 'p2pk':
      if (!supportedHashBytesP2pk.contains(payloadBytes)) {
        return 'Invalid length, expected one of [33, 65] but got $payloadBytes bytes';
      }
      return true;

    case 'other':
      // Only tests here are for odd length and valid hex, already performed
      return true;

    default:
      // Unsupported type
      return 'Invalid scriptType: $scriptType';
  }
}

/// Verify a lokad ID is valid
void verifyLokadId(String lokadId) {
  if (!_validLokadIdRegex.hasMatch(lokadId)) {
    throw ValidationException(
      'Invalid lokadId: "$lokadId". lokadId must be 4 bytes (8 chars) of lowercase hex.',
    );
  }
}

/// Verify a token ID is valid
void verifyTokenId(String tokenId) {
  if (!_validTxidRegex.hasMatch(tokenId)) {
    throw ValidationException(
      'Invalid tokenId: "$tokenId". tokenId must be 64 characters of lowercase hex.',
    );
  }
}

/// Verify a transaction ID is valid
void verifyTxid(String txid) {
  if (!_validTxidRegex.hasMatch(txid)) {
    throw ValidationException(
      'Invalid txid: "$txid". txid must be 64 characters of lowercase hex.',
    );
  }
}

/// Verify a plugin subscription is valid
void verifyPluginSubscription(WsSubPluginClient pluginSubscription) {
  final pluginName = pluginSubscription.pluginName;
  final group = pluginSubscription.group;

  if (pluginName.isEmpty) {
    throw ValidationException('pluginName must be a string');
  }
  if (group.isEmpty) {
    throw ValidationException('group must be a string');
  }

  // Test for odd length
  if (group.length % 2 != 0) {
    throw ValidationException(
      'group must have even length (complete bytes): "$group"',
    );
  }

  // Test for valid hex
  if (!_validHexRegex.hasMatch(group)) {
    throw ValidationException(
      'group must be a valid lowercase hex string: "$group"',
    );
  }
}
