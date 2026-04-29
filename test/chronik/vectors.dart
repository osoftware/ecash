// Copyright (c) 2024 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

import 'package:ecash/chronik/types.dart';

class ValidationVector {
  final String description;
  final WsSubScriptClient subscription;
  final dynamic result; // bool or String

  ValidationVector({
    required this.description,
    required this.subscription,
    required this.result,
  });
}

final List<ValidationVector> validationVectors = [
  ValidationVector(
    description: 'Valid p2pkh sub',
    subscription: WsSubScriptClient(
      scriptType: 'p2pkh',
      payload: 'd37c4c809fe9840e7bfa77b86bd47163f6fb6c60',
    ),
    result: true,
  ),
  ValidationVector(
    description: 'Valid p2sh sub',
    subscription: WsSubScriptClient(
      scriptType: 'p2sh',
      payload: 'd37c4c809fe9840e7bfa77b86bd47163f6fb6c60',
    ),
    result: true,
  ),
  ValidationVector(
    description: 'Valid 33-byte p2pk sub',
    subscription: WsSubScriptClient(
      scriptType: 'p2pk',
      payload:
          '10d141b856a092ee169c5405323895e1962c6b0d7c101120d360164c9e4b3997bd',
    ),
    result: true,
  ),
  ValidationVector(
    description: 'Valid 65-byte p2pk sub',
    subscription: WsSubScriptClient(
      scriptType: 'p2pk',
      payload:
          '047fa64f6874fb7213776b24c40bc915451b57ef7f17ad7b982561f99f7cdc7010d141b856a092ee169c5405323895e1962c6b0d7c101120d360164c9e4b3997bd',
    ),
    result: true,
  ),
  ValidationVector(
    description: 'Valid other sub',
    subscription: WsSubScriptClient(scriptType: 'other', payload: 'deadbeef'),
    result: true,
  ),
  ValidationVector(
    description: 'Otherwise valid hex that is upper case is rejected',
    subscription: WsSubScriptClient(scriptType: 'other', payload: 'DEADBEEF'),
    result: 'Invalid hex: "DEADBEEF". Payload must be lowercase hex string.',
  ),
  ValidationVector(
    description: 'Otherwise valid hex that is mixed case is rejected',
    subscription: WsSubScriptClient(scriptType: 'other', payload: 'DEADbeef'),
    result: 'Invalid hex: "DEADbeef". Payload must be lowercase hex string.',
  ),
  ValidationVector(
    description: 'Invalid sub: odd length (applies to any type)',
    subscription: WsSubScriptClient(scriptType: 'invalid', payload: 'dea'),
    result: 'Odd hex length: dea',
  ),
  ValidationVector(
    description: 'Invalid sub: bad hex (applies to any type)',
    subscription: WsSubScriptClient(scriptType: 'other', payload: 'nothex'),
    result: 'Invalid hex: "nothex". Payload must be lowercase hex string.',
  ),
  ValidationVector(
    description: 'Invalid p2pkh: bad length',
    subscription: WsSubScriptClient(
      scriptType: 'p2pkh',
      payload: 'ddd37c4c809fe9840e7bfa77b86bd47163f6fb6c60',
    ),
    result: 'Invalid length, expected 20 bytes but got 21 bytes',
  ),
  ValidationVector(
    description: 'Invalid p2sh: bad length',
    subscription: WsSubScriptClient(
      scriptType: 'p2sh',
      payload: 'ddd37c4c809fe9840e7bfa77b86bd47163f6fb6c60',
    ),
    result: 'Invalid length, expected 20 bytes but got 21 bytes',
  ),
  ValidationVector(
    description: 'Invalid p2pk: bad length',
    subscription: WsSubScriptClient(
      scriptType: 'p2pk',
      payload:
          '04047fa64f6874fb7213776b24c40bc915451b57ef7f17ad7b982561f99f7cdc7010d141b856a092ee169c5405323895e1962c6b0d7c101120d360164c9e4b3997bd',
    ),
    result: 'Invalid length, expected one of [33, 65] but got 66 bytes',
  ),
  ValidationVector(
    description: 'Invalid script type',
    subscription: WsSubScriptClient(
      scriptType: 'madeitup',
      payload: 'deadbeef',
    ),
    result: 'Invalid scriptType: madeitup',
  ),
];
