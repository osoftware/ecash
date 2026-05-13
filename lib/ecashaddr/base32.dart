// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

import 'dart:typed_data';

import 'validation.dart';

/// Charset containing the 32 symbols used in the base32 encoding.
const String charset = 'qpzry9x8gf2tvdw0s3jn54khce6mua7l';

/// Inverted index mapping each symbol into its index within the charset.
const Map<String, int> charsetInverseIndex = {
  'q': 0,
  'p': 1,
  'z': 2,
  'r': 3,
  'y': 4,
  '9': 5,
  'x': 6,
  '8': 7,
  'g': 8,
  'f': 9,
  '2': 10,
  't': 11,
  'v': 12,
  'd': 13,
  'w': 14,
  '0': 15,
  's': 16,
  '3': 17,
  'j': 18,
  'n': 19,
  '5': 20,
  '4': 21,
  'k': 22,
  'h': 23,
  'c': 24,
  'e': 25,
  '6': 26,
  'm': 27,
  'u': 28,
  'a': 29,
  '7': 30,
  'l': 31,
};

/// Encodes the given array of 5-bit integers as a base32-encoded string.
///
/// [data] Array of integers between 0 and 31 inclusive.
/// Throws [ValidationError] if input is invalid.
String encode(dynamic data) {
  validate(data is Uint8List, 'Invalid data: $data.');
  String base32 = '';
  for (int i = 0; i < (data as Uint8List).length; ++i) {
    final int value = data[i];
    validate(0 <= value && value < 32, 'Invalid value: $value.');
    base32 += charset[value];
  }
  return base32;
}

/// Decodes the given base32-encoded string into an array of 5-bit integers.
///
/// Throws [ValidationError] if input is invalid.
Uint8List decode(dynamic string) {
  validate(string is String, 'Invalid base32-encoded string: $string.');
  final Uint8List data = Uint8List((string as String).length);
  for (int i = 0; i < string.length; ++i) {
    final String value = string[i];
    validate(charsetInverseIndex.containsKey(value), 'Invalid value: $value.');
    data[i] = charsetInverseIndex[value]!;
  }
  return data;
}
