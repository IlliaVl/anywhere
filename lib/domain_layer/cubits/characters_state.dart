import 'dart:collection';

import 'package:anywhere/domain_layer/models/character.dart';
import 'package:equatable/equatable.dart';

/// Represents the state of [CharactersCubit].
class CharactersState extends Equatable {
  /// True if the cubit is processing something.
  final bool busy;

  /// List of [Character]s.
  final UnmodifiableListView<Character> characters;

  /// List of searched [Character]s.
  final UnmodifiableListView<Character> searchCharacters;

  /// Selected character.
  final Character? selectedCharacter;

  /// Error message for the last occurred error.
  final CharactersStateErrors error;

  /// Creates a new instance of [CharactersState].
  CharactersState({
    this.busy = false,
    Iterable<Character> characters = const [],
    Iterable<Character> searchCharacters = const [],
    this.selectedCharacter,
    this.error = CharactersStateErrors.none,
  })  : characters = UnmodifiableListView(characters),
        searchCharacters = UnmodifiableListView(searchCharacters);

  @override
  List<Object?> get props => [
        busy,
        characters,
        searchCharacters,
        selectedCharacter,
        error,
      ];

  /// Creates a new instance of [CharactersState] based on the current instance
  CharactersState copyWith({
    bool? busy,
    Iterable<Character>? characters,
    Iterable<Character>? searchCharacters,
    Character? selectedCharacter,
    CharactersStateErrors? error,
  }) {
    return CharactersState(
      busy: busy ?? this.busy,
      characters: characters ?? this.characters,
      searchCharacters: searchCharacters ?? this.searchCharacters,
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      error: error ?? this.error,
    );
  }
}

/// Enum for all possible errors for [CharactersCubit]
enum CharactersStateErrors {
  /// No errors
  none,

  /// Generic error
  generic,
}
