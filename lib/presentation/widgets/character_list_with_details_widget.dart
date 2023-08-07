import 'package:anywhere/presentation/widgets/character_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';
import 'characters_list_widget.dart';

/// Widget responsible for displaying list of characters
/// with details of the selected one.
class CharactersListWithDetailsWidget extends StatelessWidget {
  const CharactersListWithDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CharactersListWidget(
            showSelectedCharacter: true,
            characterSelected: context.read<CharactersCubit>().selectCharacter,
          ),
        ),
        const Flexible(
          flex: 3,
          child: CharacterDetailsWidget(),
        ),
      ],
    );
  }
}
