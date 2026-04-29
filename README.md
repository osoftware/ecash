# eCash for Flutter

Package for interacting with eCash (XEC) blockchain.

## eCash Chronik Client

A comprehensive Dart port of the JavaScript [`chronik-client`](https://github.com/Bitcoin-ABC/bitcoin-abc/tree/master/modules/chronik-client) library for accessing the Chronik blockchain indexer on eCash (XEC).

### Quick Start

```dart
import 'package:ecash/ecash.dart';

void main() async {
  // Create a client using connection strategy
  final chronik = await ChronikClient.useStrategy(
    ConnectionStrategy.closestFirst,
    [
      'https://chronik1.e.cash',
      'https://chronik2.e.cash',
    ],
  );

  // Get blockchain info
  final info = await chronik.blockchainInfo();
  print('Tip height: ${info.tipHeight}');

  // Get a transaction
  final tx = await chronik.tx('0f3c...');
  print('TX: ${tx.txid}');

  // Query script history
  final history = await chronik
      .script('p2pkh', 'hash160...')
      .history(page: 0, pageSize: 10);

  // Get UTXOs for an address
  final utxos = await chronik.address('ecash:...').utxos();

  // WebSocket subscriptions
  final ws = chronik.ws(WsConfig(
    onMessage: (msg) {
      if (msg is WsMsgBlockClient) {
        print('Block: ${msg.blockHash}');
      }
    },
  ));
  
  ws.subscribeToBlocks();

  chronik.close();
}
```

### API Overview

#### Blockchain Info

```dart
// Get blockchain information
final blockchainInfo = await chronik.blockchainInfo();

// Get server information
final chronikInfo = await chronik.chronikInfo();
```

#### Blocks

```dart
// Get a block by hash or height
final block = await chronik.block('hashOrHeight');

// Get multiple blocks
final blocks = await chronik.blocks(startHeight, endHeight);

// Get transactions in a block
final blockTxs = await chronik.blockTxs('hashOrHeight', page: 0, pageSize: 25);
```

#### Transactions

```dart
// Get transaction details
final tx = await chronik.tx('txid...');

// Get raw transaction bytes
final rawBytes = await chronik.rawTx('txid...');

// Broadcast a transaction
final response = await chronik.broadcastTx(txBytes);

// Broadcast and wait for finalization
final finalResponse = await chronik.broadcastAndFinalizeTx(txBytes);

// Validate a transaction without broadcasting
final validation = await chronik.validateRawTx(txBytes);
```

#### Scripts and Addresses

```dart
// Query by script
final scriptEndpoint = chronik.script('p2pkh', 'payload...');
final history = await scriptEndpoint.history(page: 0, pageSize: 10);
final utxos = await scriptEndpoint.utxos();
final confirmed = await scriptEndpoint.confirmedTxs();
final unconfirmed = await scriptEndpoint.unconfirmedTxs();

// Query by eCash address
final addressEndpoint = chronik.address('ecash:...');
```

#### Tokens

```dart
// Get token information
final tokenInfo = await chronik.token('tokenId...');

// Get token endpoint for queries
final tokenEndpoint = chronik.tokenId('tokenId...');
final tokenHistory = await tokenEndpoint.history();
final tokenUtxos = await tokenEndpoint.utxos();
```

#### Lokad IDs

```dart
// Get lokad ID endpoint
final lokadEndpoint = chronik.lokadId('lokadId...');
final history = await lokadEndpoint.history();
```

#### Plugins

```dart
// Get plugin endpoint
final pluginEndpoint = chronik.plugin('pluginName');
final groups = await pluginEndpoint.groups();
final utxos = await pluginEndpoint.utxos('groupHex');
final history = await pluginEndpoint.history('groupHex');
```

#### WebSocket

```dart
final ws = chronik.ws(WsConfig(
  onMessage: (msg) {
    switch (msg) {
      case WsMsgBlockClient():
        print('Block update: ${msg.blockHash}');
      case WsMsgTxClient():
        print('TX update: ${msg.tx.txid}');
      case WsErrorMsg():
        print('Error: ${msg.error}');
    }
  },
  onConnect: () {
    print('Connected');
  },
  onReconnect: (error) {
    print('Reconnecting due to: $error');
  },
  keepAlive: true,
));

// Wait for connection
await ws.waitForOpen();

// Subscribe/unsubscribe
ws.subscribeToBlocks();
ws.subscribeToScript('p2pkh', 'payload...');
ws.subscribeToAddress('ecash:...');
ws.subscribeToTokenId('tokenId...');
ws.subscribeToLokadId('lokadId...');
ws.subscribeToTxid('txid...');
ws.subscribeToTxs();  // All transactions
ws.subscribeToPlugin('pluginName', 'groupHex');

// Unsubscribe
ws.unsubscribeFromBlocks();
ws.unsubscribeFromScript('p2pkh', 'payload...');

// Mobile apps can pause/resume
ws.pause();    // Stop reconnecting
ws.resume();   // Resume reconnecting

// Close
ws.close();
```

### Connection Strategies

#### ClosestFirst (Recommended)

Selects the fastest server based on WebSocket latency measurement:

```dart
final chronik = await ChronikClient.useStrategy(
  ConnectionStrategy.closestFirst,
  ['https://chronik1.e.cash', 'https://chronik2.e.cash'],
);
```

The client will:
1. Measure latency to all servers
2. Sort by latency (fastest first)
3. Use the fastest server
4. Failover to the next fastest on connection failure

#### AsOrdered

Uses servers in the provided order:

```dart
final chronik = await ChronikClient.useStrategy(
  ConnectionStrategy.asOrdered,
  ['https://primary.e.cash', 'https://backup.e.cash'],
);
```

### Error Handling

The client throws strongly-typed exceptions:

```dart
try {
  final tx = await chronik.tx('invalid');
} on ValidationException catch (e) {
  print('Validation error: ${e.message}');
} on ServerException catch (e) {
  print('Server error: ${e.message}');
} on AllServersFailedException catch (e) {
  print('All servers failed: ${e.failedServers}');
} catch (e) {
  print('Unknown error: $e');
}
```

### Type Safety

All responses use generated protobuf message types with full type safety:

```dart
// These are all strongly typed
final tx = await chronik.tx('txid'); // Returns Tx
final block = await chronik.block('hash'); // Returns Block
final utxos = await chronik.script('p2pkh', 'hash').utxos(); // Returns UtxosResponse

// Access fields with compile-time type checking
print(tx.inputs); // List<TxInput>
print(block.blockInfo.height); // int
```

### Architecture

The library is organized into:

- **`ChronikClient`**: Main entry point for all API queries
- **Endpoint classes** (`ScriptEndpoint`, `TokenIdEndpoint`, etc.): Chainable query builders
- **`WsEndpoint`**: WebSocket connection and subscription management
- **`FailoverProxy`**: HTTP failover and connection management
- **Generated protobuf classes**: Type-safe message definitions
- **Types and exceptions**: Custom exception types

### Key Differences from JavaScript Version

1. **No dynamic typing**: All types are explicitly defined
2. **No promises**: Uses `async`/`await` and `Future`
3. **Proper null handling**: Uses Dart's built-in null safety
4. **Type-safe enums**: Strongly-typed enum values
5. **Sealed classes**: WebSocket messages use sealed classes for pattern matching
6. **Generated code**: Uses dart protobuf compiler for message definitions

### Dependencies

- `http`: ^1.1.0 - HTTP client for REST API calls
- `protobuf`: ^6.0.0 - Protocol buffer runtime
- `fixnum`: ^1.1.1 - Support for fixed-size integers in protobuf

### Development Notes

The port is fully type-safe with no `dynamic` types used anywhere. All API responses and request parameters have explicitly defined types, making it suitable for production use with strong type checking.

WebSocket functionality is framework-agnostic and can be integrated with any WebSocket implementation. The current implementation provides the subscription management infrastructure.
