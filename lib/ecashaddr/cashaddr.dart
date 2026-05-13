// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

import 'dart:typed_data';

import 'base32.dart' as base32;
import 'convert_bits.dart';
import 'types.dart';
import 'validation.dart';

/// All valid address prefixes
/// Note that as of 2.0.0 we do not validate against these prefixes
/// However we do use them to guess prefix for prefixless addrs
const List<String> validPrefixes = [
  'ecash',
  'bitcoincash',
  'simpleledger',
  'etoken',
  'ectest',
  'ecregtest',
  'bchtest',
  'bchreg',
];

/// Encodes a hash from a given type into an eCash address with the given prefix.
///
/// [prefix] Cash address prefix. E.g.: 'ecash'.
/// [type] Type of address to generate
/// [hash] Hash to encode represented as an array of 8-bit integers or hex string.
/// Throws [ValidationError]
String encodeCashAddress(String prefix, AddressType type, dynamic hash) {
  validate(_isValidPrefix(prefix), 'Invalid prefix: $prefix.');
  validate(type == 'p2pkh' || type == 'p2sh', 'Invalid type: $type.');
  validate(
    hash is Uint8List || hash is String,
    'Invalid hash: $hash. Must be string or Uint8List.',
  );
  if (hash is String) {
    hash = _stringToUint8Array(hash);
  }
  final Uint8List prefixData = _concat(
    _prefixToUint5Array(prefix),
    Uint8List(1),
  );
  final int versionByte = _getTypeBits(type) + _getHashSizeBits(hash);
  final Uint8List payloadData = _toUint5Array(
    _concat(Uint8List.fromList([versionByte]), hash),
  );
  final Uint8List checksumData = _concat(
    _concat(prefixData, payloadData),
    Uint8List(8),
  );
  final Uint8List payload = _concat(
    payloadData,
    _checksumToUint5Array(_polymod(checksumData)),
  );
  return '$prefix:${base32.encode(payload)}';
}

/// Decodes the given address into its constituting prefix, type and hash.
///
/// [address] Address to decode. E.g.: 'ecash:qpm2qsznhks23z7629mms6s4cwef74vcwva87rkuu2'.
/// Throws [ValidationError]
DecodedAddress decodeCashAddress(String address) {
  validate(_hasSingleCase(address), 'Invalid address: $address.');
  final List<String> pieces = address.toLowerCase().split(':');
  // if there is no prefix, it might still be valid
  late String prefix;
  late Uint8List payload;
  if (pieces.length == 1) {
    // Check and see if it has a valid checksum for accepted prefixes
    bool hasValidChecksum = false;
    for (int i = 0; i < validPrefixes.length; i += 1) {
      final String testedPrefix = validPrefixes[i];
      final Uint8List prefixlessPayload = base32.decode(pieces[0]);
      hasValidChecksum = _validChecksum(testedPrefix, prefixlessPayload);
      if (hasValidChecksum) {
        // Here's your prefix
        prefix = testedPrefix;
        payload = prefixlessPayload;
        // Stop testing other prefixes
        break;
      }
    }
    validate(
      hasValidChecksum,
      'Prefixless address $address does not have valid checksum for any valid prefix (${validPrefixes.join(', ')})',
    );
  } else {
    validate(pieces.length == 2, 'Invalid address: $address.');
    prefix = pieces[0];
    payload = base32.decode(pieces[1]);
    validate(_validChecksum(prefix, payload), 'Invalid checksum: $address.');
  }

  final Uint8List payloadData = _fromUint5Array(
    payload.sublist(0, payload.length - 8),
  );
  final int versionByte = payloadData[0];
  final Uint8List hash = payloadData.sublist(1);
  validate(
    _getHashSize(versionByte) == hash.length * 8,
    'Invalid hash size: $address.',
  );
  final AddressType type = _getType(versionByte);
  return DecodedAddress(
    prefix: prefix,
    type: type,
    hash: _uint8arrayToHexString(hash),
  );
}

/// Checks whether a string is a valid prefix
/// ie., it has a single letter case and no spaces
/// Could be extended to validate for accepted prefixes
bool _isValidPrefix(String prefix) {
  return _hasSingleCase(prefix) && !prefix.contains(' ');
}

/// Derives an array from the given prefix to be used in the computation
/// of the address' checksum.
Uint8List _prefixToUint5Array(String prefix) {
  final Uint8List result = Uint8List(prefix.length);
  for (int i = 0; i < prefix.length; ++i) {
    result[i] = prefix.codeUnitAt(i) & 31;
  }
  return result;
}

/// Returns an array representation of the given checksum to be encoded
/// within the address' payload.
Uint8List _checksumToUint5Array(BigInt checksum) {
  final Uint8List result = Uint8List(8);
  for (int i = 0; i < 8; ++i) {
    // Extract the least significant 5 bits (31 is 11111 in binary)
    result[7 - i] = (checksum & BigInt.from(31)).toInt();
    // Shift right by 5 bits
    checksum >>= 5;
  }
  return result;
}

/// Returns the bit representation of the given type within the version
/// byte.
int _getTypeBits(AddressType type) {
  switch (type) {
    case 'p2pkh':
      return 0;
    case 'p2sh':
      return 8;
    default:
      throw ValidationError('Invalid type: $type.');
  }
}

/// Retrieves the address type from its bit representation within the
/// version byte.
AddressType _getType(int versionByte) {
  switch (versionByte & 120) {
    case 0:
      return 'p2pkh';
    case 8:
      return 'p2sh';
    default:
      throw ValidationError(
        'Invalid address type in version byte: $versionByte.',
      );
  }
}

/// Returns the bit representation of the length in bits of the given
/// hash within the version byte.
int _getHashSizeBits(Uint8List hash) {
  switch (hash.length * 8) {
    case 160:
      return 0;
    case 192:
      return 1;
    case 224:
      return 2;
    case 256:
      return 3;
    case 320:
      return 4;
    case 384:
      return 5;
    case 448:
      return 6;
    case 512:
      return 7;
    default:
      throw ValidationError('Invalid hash size: ${hash.length}.');
  }
}

/// Retrieves the the length in bits of the encoded hash from its bit
/// representation within the version byte.
int _getHashSize(int versionByte) {
  switch (versionByte & 7) {
    case 0:
      return 160;
    case 1:
      return 192;
    case 2:
      return 224;
    case 3:
      return 256;
    case 4:
      return 320;
    case 5:
      return 384;
    case 6:
      return 448;
    case 7:
      return 512;
    default:
      throw Error();
  }
}

/// Converts an array of 8-bit integers into an array of 5-bit integers,
/// right-padding with zeroes if necessary.
Uint8List _toUint5Array(Uint8List data) {
  return convertBits(data, 8, 5);
}

/// Converts an array of 5-bit integers back into an array of 8-bit integers,
/// removing extra zeroes left from padding if necessary.
/// Throws a [ValidationError] if input is not a zero-padded array of 8-bit integers.
Uint8List _fromUint5Array(Uint8List data) {
  return convertBits(data, 5, 8, strictMode: true);
}

/// Returns the concatenation of a and b.
Uint8List _concat(Uint8List a, Uint8List b) {
  final Uint8List ab = Uint8List(a.length + b.length);
  ab.setRange(0, a.length, a);
  ab.setRange(a.length, a.length + b.length, b);
  return ab;
}

/// Computes a checksum from the given input data as specified for the CashAddr
/// format: https://github.com/Bitcoin-UAHF/spec/blob/master/cashaddr.md.
BigInt _polymod(Uint8List data) {
  final List<BigInt> generator = [
    BigInt.parse('0x98f2bc8e61'),
    BigInt.parse('0x79b76d99e2'),
    BigInt.parse('0xf33e5fb3c4'),
    BigInt.parse('0xae2eabe2a8'),
    BigInt.parse('0x1e4f43e470'),
  ];
  BigInt checksum = BigInt.one;

  for (int i = 0; i < data.length; i += 1) {
    final BigInt value = BigInt.from(data[i]);
    final BigInt topBits = checksum >> 35;
    checksum = ((checksum & BigInt.parse('0x07ffffffff')) << 5) ^ value;

    for (int j = 0; j < generator.length; ++j) {
      if (((topBits >> j) & BigInt.one) == BigInt.one) {
        checksum ^= generator[j];
      }
    }
  }
  return checksum ^ BigInt.one;
}

/// Verify that the payload has not been corrupted by checking that the
/// checksum is valid.
bool _validChecksum(String prefix, Uint8List payload) {
  final Uint8List prefixData = _concat(
    _prefixToUint5Array(prefix),
    Uint8List(1),
  );
  final Uint8List checksumData = _concat(prefixData, payload);
  return _polymod(checksumData) == BigInt.zero;
}

/// Returns true if, and only if, the given string contains either uppercase
/// or lowercase letters, but not both.
bool _hasSingleCase(String string) {
  return string == string.toLowerCase() || string == string.toUpperCase();
}

/// Returns a uint8array for a given hex string input
Uint8List _stringToUint8Array(String string) {
  final Uint8List array = Uint8List(string.length ~/ 2);
  for (int i = 0; i < string.length; i += 2) {
    // Convert each pair of characters to an integer
    array[i ~/ 2] = int.parse(string.substring(i, i + 2), radix: 16);
  }
  return array;
}

/// Returns a hex string for a given uint8array input
String _uint8arrayToHexString(Uint8List uint8Array) {
  String hexString = '';
  for (int i = 0; i < uint8Array.length; i++) {
    String hex = uint8Array[i].toRadixString(16);
    // Ensure we have 2 digits for each byte
    hex = hex.length == 1 ? '0$hex' : hex;
    hexString += hex;
  }
  return hexString;
}

/// Get type and hash from an outputScript
///
/// Supported outputScripts:
///
/// P2PKH: 76a914<hash>88ac
/// P2SH:  a914<hash>87
///
/// Validates for supported outputScript and hash length
TypeAndHash getTypeAndHashFromOutputScript(String outputScript) {
  const String p2pkhPrefix = '76a914';
  const String p2pkhSuffix = '88ac';

  const String p2shPrefix = 'a914';
  const String p2shSuffix = '87';

  late String hash;
  late AddressType type;

  // If outputScript begins with '76a914' and ends with '88ac'
  if (outputScript.substring(0, p2pkhPrefix.length) == p2pkhPrefix &&
      outputScript.substring(outputScript.length - p2pkhSuffix.length) ==
          p2pkhSuffix) {
    // We have type p2pkh
    type = 'p2pkh';

    // hash is the string in between '76a914' and '88ac'
    hash = outputScript.substring(
      outputScript.indexOf(p2pkhPrefix) + p2pkhPrefix.length,
      outputScript.lastIndexOf(p2pkhSuffix),
    );
    // If outputScript begins with 'a914' and ends with '87'
  } else if (outputScript.substring(0, p2shPrefix.length) == p2shPrefix &&
      outputScript.substring(outputScript.length - p2shSuffix.length) ==
          p2shSuffix) {
    // We have type p2sh
    type = 'p2sh';
    // hash is the string in between 'a914' and '87'
    hash = outputScript.substring(
      outputScript.indexOf(p2shPrefix) + p2shPrefix.length,
      outputScript.lastIndexOf(p2shSuffix),
    );
  } else {
    // Throw validation error if outputScript not of these two types
    throw ValidationError('Unsupported outputScript: $outputScript');
  }

  // Throw validation error if hash is of invalid size
  // Per spec, valid hash sizes in bytes
  const List<int> validSizes = [20, 24, 28, 32, 40, 48, 56, 64];

  if (!validSizes.contains(hash.length ~/ 2)) {
    throw ValidationError('Invalid hash size in outputScript: $outputScript');
  }
  return TypeAndHash(type: type, hash: hash);
}

/// Get output script from type and hash
String getOutputScriptFromTypeAndHash(AddressType type, String hash) {
  validate(type == 'p2pkh' || type == 'p2sh', 'Invalid type: $type.');
  String outputScript;
  if (type == 'p2pkh') {
    outputScript = '76a914${hash}88ac';
  } else {
    outputScript = 'a914${hash}87';
  }
  return outputScript;
}
