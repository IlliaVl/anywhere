import 'package:anywhere/domain_layer/models/character.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base_repository/characters_repository_interface.dart';
import '../models/characters_error.dart';
import 'characters_state.dart';

/// Cubit responsible for retrieving the list of [Character].
class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepositoryInterface _repository;

  /// Creates a new instance of [CharactersCubit]
  CharactersCubit({
    required CharactersRepositoryInterface repository,
  })  : _repository = repository,
        super(CharactersState());

  /// Loads all [Character]s.
  Future<void> getCharacters() async {
    emit(
      state.copyWith(
        busy: true,
        error: CharactersStateErrors.none,
      ),
    );

    try {
      final characters = await _repository.getCharacters();

      emit(
        state.copyWith(
          characters: characters,
          searchCharacters: characters,
          selectedCharacter: characters.first,
          busy: false,
          error: CharactersStateErrors.none,
        ),
      );
    } on CharactersException {
      emit(
        state.copyWith(
          busy: true,
          error: CharactersStateErrors.generic,
        ),
      );
    }
  }

  /// Selects character by index.
  void selectCharacter(int index) {
    emit(
      state.copyWith(
        selectedCharacter: state.searchCharacters[index],
        error: CharactersStateErrors.none,
      ),
    );
  }

  /// Search characters which contain provided text value in the name
  /// or in the description.
  void searchCharacters(String value) {
    if (value.isEmpty) {
      emit(
        state.copyWith(
          searchCharacters: state.characters,
          error: CharactersStateErrors.none,
        ),
      );
      return;
    }
    final searchLowerCase = value.toLowerCase();

    final searchCharacters = state.characters
        .where(
          (character) =>
              (character.name?.toLowerCase().contains(searchLowerCase) ??
                  false) ||
              (character.description?.toLowerCase().contains(searchLowerCase) ??
                  false),
        )
        .toList();

    final availableSelectedCharacter = searchCharacters.firstWhereOrNull(
      (character) => character.name == state.selectedCharacter?.name,
    );

    emit(
      state.copyWith(
        selectedCharacter: availableSelectedCharacter == null
            ? (searchCharacters.isNotEmpty
                ? searchCharacters.first
                : Character())
            : state.selectedCharacter,
        searchCharacters: searchCharacters,
        error: CharactersStateErrors.none,
      ),
    );
  }
}
