import 'package:anywhere/domain_layer/cubits/characters_cubit.dart';
import 'package:anywhere/presentation/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_state.dart';
import '../widgets/character_list_with_details_widget.dart';
import '../widgets/characters_list_widget.dart';

/// Main screen of the application. Depending on the screen width displays data
/// as following:
///  * list of characters with navigation to the new screen with character's
/// details;
///  * list of characters with the description of the selected tile.
class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) => state.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return const CharactersListWithDetailsWidget();
                } else {
                  return CharactersListWidget(
                    characterSelected: (index) {
                      context.read<CharactersCubit>().selectCharacter(index);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<CharactersCubit>(),
                            child: const DetailsScreen(),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
      ),
    );
  }
}
