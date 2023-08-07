import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';

/// Widget responsible for displaying the details of the character.
class CharacterDetailsWidget extends StatelessWidget {
  const CharacterDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCharacter =
        context.watch<CharactersCubit>().state.selectedCharacter;

    return selectedCharacter == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  selectedCharacter.name ?? '',
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  selectedCharacter.description ?? '',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );
  }
}
