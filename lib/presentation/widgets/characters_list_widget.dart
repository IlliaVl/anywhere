import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';

/// Widget responsible for displaying list of characters.
class CharactersListWidget extends StatelessWidget {
  final ValueChanged<int> characterSelected;

  final int? selectedCharacterIndex;

  const CharactersListWidget({
    super.key,
    required this.characterSelected,
    this.selectedCharacterIndex,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<CharactersCubit>().state;

    return ListView.builder(
      itemCount: state.characters.length,
      itemBuilder: (context, index) => Card(
        color: index == selectedCharacterIndex ? Colors.white70 : null,
        child: InkWell(
          onTap: () => characterSelected(index),
          child: ListTile(
            title: Text(
              state.characters[index].name ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
