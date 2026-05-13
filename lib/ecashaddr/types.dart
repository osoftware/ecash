// Copyright (c) 2024 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

/// Address type: either 'p2pkh' or 'p2sh'
typedef AddressType = String;

/// Represents a decoded cash address with its components
class DecodedAddress {
  final String prefix;
  final AddressType type;
  final String hash;

  DecodedAddress({
    required this.prefix,
    required this.type,
    required this.hash,
  });

  @override
  String toString() =>
      'DecodedAddress(prefix: $prefix, type: $type, hash: $hash)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DecodedAddress &&
          runtimeType == other.runtimeType &&
          prefix == other.prefix &&
          type == other.type &&
          hash == other.hash;

  @override
  int get hashCode => prefix.hashCode ^ type.hashCode ^ hash.hashCode;
}

/// Represents the type and hash components of an address
class TypeAndHash {
  final AddressType type;
  final String hash;

  TypeAndHash({required this.type, required this.hash});

  @override
  String toString() => 'TypeAndHash(type: $type, hash: $hash)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeAndHash &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          hash == other.hash;

  @override
  int get hashCode => type.hashCode ^ hash.hashCode;
}
