import 'package:anywhere/presentation/widgets/character_details_widget.dart';
import 'package:flutter/material.dart';

import '../../domain_layer/models/character.dart';

/// Screen for displaying details of character.
class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: CharacterDetailsWidget(
        character: character,
      ),
    );
  }
}
