// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

import 'dart:math';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:ecash/ecashaddr/base32.dart' as base32;
import 'package:ecash/ecashaddr/base32.dart';
import 'package:ecash/ecashaddr/validation.dart';

void main() {
  group('base32', () {
    Uint8List getRandomData(int size) {
      final data = Uint8List(size);
      final random = Random();
      for (int i = 0; i < size; ++i) {
        data[i] = random.nextInt(32);
      }
      return data;
    }

    group('#encode()', () {
      test('should fail on invalid input', () {
        final invalidInputs = [
          1234.567,
          'some string',
          [1, 2, 3, 4],
        ];
        for (final input in invalidInputs) {
          expect(
            () => base32.encode(input as dynamic),
            throwsA(isA<ValidationError>()),
          );
        }
      });

      test('should encode single digits correctly', () {
        for (int i = 0; i < charset.length; ++i) {
          final testArray = Uint8List.fromList([i]);
          expect(charset[i], base32.encode(testArray));
        }
      });
    });

    group('#decode()', () {
      test('should fail on invalid input', () {
        final invalidInputs = [
          1234.567,
          [1, 2, 3, 4],
          'b',
        ];
        for (final input in invalidInputs) {
          expect(
            () => base32.decode(input as dynamic),
            throwsA(isA<ValidationError>()),
          );
        }
      });

      test('should decode single digits correctly', () {
        for (int i = 0; i < charset.length; ++i) {
          final decoded = base32.decode(charset[i]);
          expect(decoded.length, 1);
          expect(i, decoded[0]);
        }
      });
    });

    group('#encode() #decode()', () {
      test('should encode and decode random data correctly', () {
        const numTests = 2000;
        for (int i = 0; i < numTests; ++i) {
          final data = getRandomData(1000);
          final x = base32.encode(data);
          expect(base32.decode(x), data);
        }
      });
    });
  });
}
