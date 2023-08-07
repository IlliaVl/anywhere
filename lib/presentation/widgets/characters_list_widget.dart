import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';

/// Widget responsible for displaying list of characters.
class CharactersListWidget extends StatelessWidget {
  const CharactersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CharactersCubit>().state;

    return ListView.builder(
      itemCount: state.characters.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(
            state.characters[index].name ?? '',
          ),
        ),
      ),
    );
  }
}
