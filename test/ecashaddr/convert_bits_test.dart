// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

import 'dart:math';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:ecash/ecashaddr/convert_bits.dart';
import 'package:ecash/ecashaddr/validation.dart';

void main() {
  group('#convertBits()', () {
    Uint8List getRandomData(int size, int max) {
      final data = Uint8List(size);
      final random = Random();
      for (int i = 0; i < size; ++i) {
        data[i] = random.nextInt(max + 1);
      }
      return data;
    }

    test('should fail if it receives an invalid value', () {
      expect(() {
        convertBits(Uint8List.fromList([100]), 5, 8);
      }, throwsA(isA<ValidationError>()));
    });

    test('should fail in strict mode if padding is needed', () {
      final data = getRandomData(10, 31);
      expect(() {
        convertBits(data, 5, 8, strictMode: true);
      }, throwsA(isA<ValidationError>()));
    });

    test('should convert both ways successfully', () {
      final data1 = getRandomData(80, 31);
      expect(convertBits(convertBits(data1, 5, 8), 8, 5), data1);
      final data2 = getRandomData(80, 255);
      expect(convertBits(convertBits(data2, 8, 5), 5, 8), data2);
    });
  });
}
