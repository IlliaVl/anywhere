import 'package:anywhere/presentation/widgets/character_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';
import 'characters_list_widget.dart';

/// Widget responsible for displaying list of characters
/// with details of the selected one.
class CharactersListWithDetailsWidget extends StatefulWidget {
  const CharactersListWithDetailsWidget({
    super.key,
  });

  @override
  State<CharactersListWithDetailsWidget> createState() =>
      _CharactersListWithDetailsWidgetState();
}

class _CharactersListWithDetailsWidgetState
    extends State<CharactersListWithDetailsWidget> {
  int selectedCharacterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CharactersListWidget(
            selectedCharacterIndex: selectedCharacterIndex,
            characterSelected: (index) =>
                setState(() => selectedCharacterIndex = index),
          ),
        ),
        Flexible(
          flex: 3,
          child: CharacterDetailsWidget(
            character: context
                .read<CharactersCubit>()
                .state
                .characters[selectedCharacterIndex],
          ),
        ),
      ],
    );
  }
}
