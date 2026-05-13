// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

import 'dart:math';
import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:ecash/ecashaddr/cashaddr.dart';
import 'package:ecash/ecashaddr/types.dart';
import 'package:ecash/ecashaddr/validation.dart';

void main() {
  group('cashaddr', () {
    const List<String> networks = ['ecash', 'ectest', 'etoken'];

    const List<String> addressTypes = ['p2pkh', 'p2sh'];

    const List<int> validSizes = [20, 24, 28, 32, 40, 48, 56, 64];

    final List<Uint8List> testHashes = [
      Uint8List.fromList([
        118,
        160,
        64,
        83,
        189,
        160,
        168,
        139,
        218,
        81,
        119,
        184,
        106,
        21,
        195,
        178,
        159,
        85,
        152,
        115,
      ]),
      Uint8List.fromList([
        203,
        72,
        18,
        50,
        41,
        156,
        213,
        116,
        49,
        81,
        172,
        75,
        45,
        99,
        174,
        25,
        142,
        123,
        176,
        169,
      ]),
      Uint8List.fromList([
        1,
        31,
        40,
        228,
        115,
        201,
        95,
        64,
        19,
        215,
        213,
        62,
        197,
        251,
        195,
        180,
        45,
        248,
        237,
        16,
      ]),
    ];

    const List<String> testHashesStrings = [
      '76a04053bda0a88bda5177b86a15c3b29f559873',
      'cb481232299cd5743151ac4b2d63ae198e7bb0a9',
      '011f28e473c95f4013d7d53ec5fbc3b42df8ed10',
    ];

    const List<String> testP2pkhOutputscripts = [
      '76a91476a04053bda0a88bda5177b86a15c3b29f55987388ac',
      '76a914cb481232299cd5743151ac4b2d63ae198e7bb0a988ac',
      '76a914011f28e473c95f4013d7d53ec5fbc3b42df8ed1088ac',
    ];

    const List<String> expectedP2pkhOutputs = [
      'ecash:qpm2qsznhks23z7629mms6s4cwef74vcwva87rkuu2',
      'ecash:qr95sy3j9xwd2ap32xkykttr4cvcu7as4ykdcjcn6n',
      'ecash:qqq3728yw0y47sqn6l2na30mcw6zm78dzq653y7pv5',
    ];

    const List<String> testP2shOutputscripts = [
      'a91476a04053bda0a88bda5177b86a15c3b29f55987387',
      'a914cb481232299cd5743151ac4b2d63ae198e7bb0a987',
      'a914011f28e473c95f4013d7d53ec5fbc3b42df8ed1087',
    ];

    const List<String> expectedP2shOutputs = [
      'ecash:ppm2qsznhks23z7629mms6s4cwef74vcwv2zrv3l8h',
      'ecash:pr95sy3j9xwd2ap32xkykttr4cvcu7as4ypg9alspw',
      'ecash:pqq3728yw0y47sqn6l2na30mcw6zm78dzqd3vtezhf',
    ];

    const List<String> expectedP2pkhOutputsTestnet = [
      'ectest:qpm2qsznhks23z7629mms6s4cwef74vcwvmvqr33lm',
      'ectest:qr95sy3j9xwd2ap32xkykttr4cvcu7as4ysxxjl7ez',
      'ectest:qqq3728yw0y47sqn6l2na30mcw6zm78dzqul0yev09',
    ];

    const List<String> expectedP2shOutputsTestnet = [
      'ectest:ppm2qsznhks23z7629mms6s4cwef74vcwvvfavkjyx',
      'ectest:pr95sy3j9xwd2ap32xkykttr4cvcu7as4y8rmacazl',
      'ectest:pqq3728yw0y47sqn6l2na30mcw6zm78dzqt6jt705c',
    ];

    Uint8List getRandomHash(int size) {
      final hash = Uint8List(size);
      final random = Random();
      for (int i = 0; i < size; ++i) {
        hash[i] = random.nextInt(256);
      }
      return hash;
    }

    group('#encodeCashAddress()', () {
      test('should fail on an invalid prefix', () {
        expect(() {
          encodeCashAddress(
            'some invalid prefix because spaces',
            addressTypes[0],
            Uint8List(0),
          );
        }, throwsA(isA<ValidationError>()));
      });

      test('should fail on a prefix with mixed letter case', () {
        expect(() {
          encodeCashAddress('EcAsH', addressTypes[0], Uint8List(0));
        }, throwsA(isA<ValidationError>()));
      });

      test('should fail on an invalid type', () {
        expect(() {
          encodeCashAddress(
            networks[0],
            'some invalid type' as dynamic,
            Uint8List(0),
          );
        }, throwsA(isA<ValidationError>()));
      });

      test('should fail on hashes of invalid length', () {
        for (final size in validSizes) {
          final hash = getRandomHash(size - 1);
          expect(() {
            encodeCashAddress(networks[0], addressTypes[0], hash);
          }, throwsA(isA<ValidationError>()));
        }
      });

      test(
        'should encode test hashes on mainnet correctly with uint8Array hash input',
        () {
          for (int index = 0; index < testHashes.length; index++) {
            expect(
              encodeCashAddress('ecash', 'p2pkh', testHashes[index]),
              expectedP2pkhOutputs[index],
            );
            expect(
              encodeCashAddress('ecash', 'p2sh', testHashes[index]),
              expectedP2shOutputs[index],
            );
          }
        },
      );

      test(
        'should encode test hashes on mainnet correctly with string input for hash',
        () {
          for (int index = 0; index < testHashes.length; index++) {
            expect(
              encodeCashAddress('ecash', 'p2pkh', testHashesStrings[index]),
              expectedP2pkhOutputs[index],
            );
            expect(
              encodeCashAddress('ecash', 'p2sh', testHashesStrings[index]),
              expectedP2shOutputs[index],
            );
          }
        },
      );

      test('should encode test hashes on testnet correctly', () {
        for (int index = 0; index < testHashes.length; index++) {
          expect(
            encodeCashAddress('ectest', 'p2pkh', testHashes[index]),
            expectedP2pkhOutputsTestnet[index],
          );
          expect(
            encodeCashAddress('ectest', 'p2sh', testHashes[index]),
            expectedP2shOutputsTestnet[index],
          );
        }
      });
    });

    group('#decodeCashAddress()', () {
      test('should decode valid addresses correctly', () {
        for (int index = 0; index < testHashes.length; index++) {
          final decoded = decodeCashAddress(expectedP2pkhOutputs[index]);
          expect(decoded.prefix, 'ecash');
          expect(decoded.type, 'p2pkh');
          expect(decoded.hash, testHashesStrings[index]);
        }
      });

      test('should decode p2sh addresses correctly', () {
        for (int index = 0; index < testHashes.length; index++) {
          final decoded = decodeCashAddress(expectedP2shOutputs[index]);
          expect(decoded.prefix, 'ecash');
          expect(decoded.type, 'p2sh');
          expect(decoded.hash, testHashesStrings[index]);
        }
      });

      test('should fail on invalid checksums', () {
        expect(() {
          decodeCashAddress('ecash:qpm2qsznhks23z7629mms6s4cwef74vcwva87rkuu3');
        }, throwsA(isA<ValidationError>()));
      });
    });

    group(
      '#getTypeAndHashFromOutputScript() and #getOutputScriptFromTypeAndHash()',
      () {
        test(
          'should get type and hash from outputScripts on mainnet correctly',
          () {
            for (int index = 0; index < testHashesStrings.length; index++) {
              // outputScript => {type, hash}
              expect(
                getTypeAndHashFromOutputScript(testP2pkhOutputscripts[index]),
                TypeAndHash(type: 'p2pkh', hash: testHashesStrings[index]),
              );
              // {type, hash} => outputScript
              expect(
                getOutputScriptFromTypeAndHash(
                  'p2pkh',
                  testHashesStrings[index],
                ),
                testP2pkhOutputscripts[index],
              );
              // outputScript => {type, hash}
              expect(
                getTypeAndHashFromOutputScript(testP2shOutputscripts[index]),
                TypeAndHash(type: 'p2sh', hash: testHashesStrings[index]),
              );
              // {type, hash} => outputScript
              expect(
                getOutputScriptFromTypeAndHash(
                  'p2sh',
                  testHashesStrings[index],
                ),
                testP2shOutputscripts[index],
              );
            }
          },
        );

        test('should fail on unsupported outputScripts', () {
          expect(() {
            getTypeAndHashFromOutputScript('00' * 50);
          }, throwsA(isA<ValidationError>()));
        });

        test('should fail on invalid hash sizes in outputScripts', () {
          expect(() {
            getTypeAndHashFromOutputScript('76a914${'00' * 19}88ac');
          }, throwsA(isA<ValidationError>()));
        });
      },
    );
  });
}
