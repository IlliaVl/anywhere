import 'package:anywhere/presentation/widgets/character_details_widget.dart';
import 'package:flutter/material.dart';

/// Screen for displaying details of character.
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const CharacterDetailsWidget(),
    );
  }
}
