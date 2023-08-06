import 'package:anywhere/data_layer/mappings/related_topic_dto_mapping.dart';

import '../../domain_layer/base_repository/characters_repository_interface.dart';
import '../../domain_layer/models/character.dart';
import '../providers/duckduckgo_provider.dart';

/// Handles all the characters data
class CharactersRepository implements CharactersRepositoryInterface {
  final DuckduckgoProvider _duckduckgoProvider;

  /// Creates a new [CharactersRepository] instance
  CharactersRepository(this._duckduckgoProvider);

  /// Retrieves the list of [Character].
  @override
  Future<List<Character>> getCharacters() async {
    final relatedTopics = await _duckduckgoProvider.getRelatedTopics();
    return relatedTopics
        .map((relatedTopicDTO) => relatedTopicDTO.toCharacter())
        .toList();
  }
}
