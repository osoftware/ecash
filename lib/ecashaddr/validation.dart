// Copyright (c) 2023-2025 The Bitcoin developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Copyright (c) 2017-2020 Emilio Almansi

/// Error thrown when encoding or decoding fail due to invalid input.
class ValidationError extends Error {
  final String message;

  ValidationError(this.message);

  @override
  String toString() => 'ValidationError: $message';
}

/// Validates a given condition, throwing a [ValidationError] if
/// the given condition does not hold.
void validate(bool condition, String message) {
  if (!condition) {
    throw ValidationError(message);
  }
}
