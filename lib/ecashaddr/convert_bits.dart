// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2018 Emilio Almansi
// Copyright (c) 2017 Pieter Wuille
// Copyright (c) 2024 Bitcoin ABC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'dart:typed_data';

import 'validation.dart';

/// Converts an array of integers made up of 'from' bits into an
/// array of integers made up of 'to' bits. The output array is
/// zero-padded if necessary, unless strict mode is true.
/// Throws a [ValidationError] if input is invalid.
/// Original by Pieter Wuille: https://github.com/sipa/bech32.
///
/// [data] Array of integers made up of 'from' bits.
/// [from] Length in bits of elements in the input array.
/// [to] Length in bits of elements in the output array.
/// [strictMode] Require the conversion to be completed without padding.
Uint8List convertBits(
  Uint8List data,
  int from,
  int to, {
  bool strictMode = false,
}) {
  final int length = strictMode
      ? ((data.length * from) ~/ to)
      : ((data.length * from + to - 1) ~/ to);
  final int mask = (1 << to) - 1;
  final Uint8List result = Uint8List(length);
  int index = 0;
  int accumulator = 0;
  int bits = 0;
  for (int i = 0; i < data.length; ++i) {
    final int value = data[i];
    validate(0 <= value && (value >> from) == 0, 'Invalid value: $value.');
    accumulator = (accumulator << from) | value;
    bits += from;
    while (bits >= to) {
      bits -= to;
      result[index] = (accumulator >> bits) & mask;
      ++index;
    }
  }
  if (!strictMode) {
    if (bits > 0) {
      result[index] = (accumulator << (to - bits)) & mask;
      ++index;
    }
  } else {
    validate(
      bits < from && ((accumulator << (to - bits)) & mask) == 0,
      'Input cannot be converted to $to bits without padding, but strict mode was used.',
    );
  }
  return result;
}
