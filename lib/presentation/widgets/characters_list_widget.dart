import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_cubit.dart';
import '../../domain_layer/cubits/characters_state.dart';

/// Widget responsible for displaying list of characters.
class CharactersListWidget extends StatelessWidget {
  final ValueChanged<int> characterSelected;

  final bool showSelectedCharacter;

  const CharactersListWidget({
    super.key,
    required this.characterSelected,
    this.showSelectedCharacter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(
            onChanged: context.read<CharactersCubit>().searchCharacters,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: state.searchCharacters.length,
                itemBuilder: (context, index) => Card(
                  color: showSelectedCharacter &&
                          state.searchCharacters[index].name ==
                              state.selectedCharacter?.name
                      ? Colors.white70
                      : null,
                  child: InkWell(
                    onTap: () => characterSelected(index),
                    child: ListTile(
                      title: Text(
                        state.searchCharacters[index].name ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        state.searchCharacters[index].description ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
