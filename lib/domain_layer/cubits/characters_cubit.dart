import 'package:anywhere/domain_layer/models/character.dart';
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
}
