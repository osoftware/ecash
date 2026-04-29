// Copyright (c) 2023-2024 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

import 'package:test/test.dart';
import 'package:ecash/chronik/failover_proxy.dart';
import 'package:ecash/chronik/validation.dart';
import 'package:ecash/chronik/types.dart';
import 'vectors.dart';

void main() {
  group('FailoverProxy', () {
    test('appendWsUrls combines an object array of valid urls with wsUrls', () {
      final urls = [
        'https://chronik.be.cash/xec',
        'http://chronik.fabien.cash',
        'https://chronik2.fabien.cash',
      ];
      var expected = [
        Endpoint(
          url: 'https://chronik.be.cash/xec',
          wsUrl: 'wss://chronik.be.cash/xec/ws',
        ),
        Endpoint(
          url: 'http://chronik.fabien.cash',
          wsUrl: 'ws://chronik.fabien.cash/ws',
        ),
        Endpoint(
          url: 'https://chronik2.fabien.cash',
          wsUrl: 'wss://chronik2.fabien.cash/ws',
        ),
      ];
      expect(appendWsUrls(urls), equals(expected));
    });

    test(
      'appendWsUrls combines an array of mixed valid https and http urls with wsUrls',
      () {
        final urls = [
          'https://chronik.be.cash/xec',
          'http://chronik.fabien.cash',
          'https://chronik2.fabien.cash',
        ];
        var expected = [
          Endpoint(
            url: 'https://chronik.be.cash/xec',
            wsUrl: 'wss://chronik.be.cash/xec/ws',
          ),
          Endpoint(
            url: 'http://chronik.fabien.cash',
            wsUrl: 'ws://chronik.fabien.cash/ws',
          ),
          Endpoint(
            url: 'https://chronik2.fabien.cash',
            wsUrl: 'wss://chronik2.fabien.cash/ws',
          ),
        ];
        expect(appendWsUrls(urls), equals(expected));
      },
    );
    test('appendWsUrls returns an empty array for an empty input', () {
      expect(appendWsUrls([]), equals([]));
    });
    test('appendWsUrls throws error on an invalid regular endpoint', () {
      final urls = [
        'https://chronik.be.cash/xec',
        'not-a-valid-url',
        'https://chronik2.fabien.cash',
      ];
      expect(() => appendWsUrls(urls), throwsA(isA<ValidationException>()));
    });

    test('FailoverProxy instantiates with a valid url array', () {
      final urls = [
        'https://chronik.be.cash/xec',
        'http://chronik.fabien.cash',
        'https://chronik2.fabien.cash',
      ];
      final proxy = FailoverProxy(urls);
      var expected = [
        Endpoint(
          url: 'https://chronik.be.cash/xec',
          wsUrl: 'wss://chronik.be.cash/xec/ws',
        ),
        Endpoint(
          url: 'http://chronik.fabien.cash',
          wsUrl: 'ws://chronik.fabien.cash/ws',
        ),
        Endpoint(
          url: 'https://chronik2.fabien.cash',
          wsUrl: 'wss://chronik2.fabien.cash/ws',
        ),
      ];
      expect(proxy.endpointArray, equals(expected));
    });

    test(
      'FailoverProxy constructor throws error on an invalid regular endpoint',
      () {
        final oneBrokenUrl = [
          'https://chronik.be.cash/xec',
          'not-a-valid-url',
          'https://chronik2.fabien.cash',
        ];
        expect(
          () => FailoverProxy(oneBrokenUrl),
          throwsA(isA<ValidationException>()),
        );
      },
    );
  });

  group('deriveEndpointIndex', () {
    test('iterates through endpoint array with default working index', () {
      final urls = [
        'https://chronik.be.cash/xec',
        'http://chronik.fabien.cash',
        'https://chronik2.fabien.cash',
        'https://chronik3.fabien.cash',
      ];
      final proxy = FailoverProxy(urls);

      final indexOrder = <int>[];
      for (int i = 0; i < urls.length; i++) {
        indexOrder.add(proxy.deriveEndpointIndex(i));
      }

      expect(indexOrder, equals([0, 1, 2, 3]));
    });

    test('iterates through endpoint array with working index set to 3', () {
      final urls = [
        'https://chronik.be.cash/xec',
        'http://chronik.fabien.cash',
        'https://chronik2.fabien.cash',
        'https://chronik3.fabien.cash',
      ];
      final proxy = FailoverProxy(urls);

      // Override the working index to 3
      proxy.setWorkingIndex(3);

      final indexOrder = <int>[];
      for (int i = 0; i < urls.length; i++) {
        indexOrder.add(proxy.deriveEndpointIndex(i));
      }

      expect(indexOrder, equals([3, 0, 1, 2]));
    });
  });

  group('isValidWsSubscription', () {
    for (final vector in validationVectors) {
      test('isValidWsSubscription: ${vector.description}', () {
        final result = isValidWsSubscription(vector.subscription);
        expect(result, equals(vector.result));
      });
    }
  });

  group('FailoverProxy.connectWs failover', () {});
}
