import 'package:anywhere/domain_layer/cubits/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/cubits/characters_state.dart';
import '../widgets/characters_list_widget.dart';

/// Main screen of the application. Depending on the screen width displays data
/// as following:
///  * list of characters with navigation to the new screen with character's
/// details;
///  * list of characters with the description of the selected tile.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.title});

  final String title;

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
                  return const Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CharactersListWidget(),
                      ),
                      Flexible(
                        flex: 3,
                        child: CharactersListWidget(),
                      ),
                    ],
                  );
                } else {
                  return const CharactersListWidget();
                }
              }),
      ),
    );
  }
}
