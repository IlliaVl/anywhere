import 'package:anywhere/domain_layer/models/character.dart';
import 'package:flutter/material.dart';

/// Widget responsible for displaying the details of the character.
class CharacterDetailsWidget extends StatelessWidget {
  final Character character;

  const CharacterDetailsWidget({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            character.name ?? '',
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            character.description ?? '',
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
