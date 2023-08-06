/// Thrown if during fetching characters process failure occurs.
class CharactersException implements Exception {
  /// Type of error.
  final CharacterExceptionType errorType;

  /// The associated error message.
  final String message;

  /// Creates [CharactersException].
  const CharactersException(
    this.errorType, [
    this.message = 'An unknown exception occurred.',
  ]);
}

/// Types of [CharactersException]s.
enum CharacterExceptionType {
  /// If error occurs at parsing stage.
  parsing,

  /// If error occurs at performing request stage.
  network
}
