import '../models/character.dart';

/// Abstract definition for the characters repository.
abstract class CharactersRepositoryInterface {
  /// Retrieves the list of [Character].
  Future<List<Character>> getCharacters();
}
