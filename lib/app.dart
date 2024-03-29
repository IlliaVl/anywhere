import 'package:anywhere/data_layer/repositories/characters_repository.dart';
import 'package:anywhere/domain_layer/cubits/characters_cubit.dart';
import 'package:anywhere/flavor.dart';
import 'package:anywhere/presentation/theme/anywhere_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_layer/providers/duckduckgo_provider.dart';
import 'presentation/screens/main_screen.dart';

class MyApp extends StatelessWidget {
  final Flavor flavor;

  const MyApp({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anywhere',
      themeMode: ThemeMode.system, // Use system theme mode
      theme: AnywhereTheme.light, // Light theme
      darkTheme: AnywhereTheme.dark, // Dark theme
      home: BlocProvider<CharactersCubit>(
        create: (context) => CharactersCubit(
          repository: CharactersRepository(
            DuckduckgoProvider(
              baseQuery: flavor.endpoint,
            ),
          ),
        )..getCharacters(),
        child: MainScreen(
          title: flavor.appName,
        ),
      ),
    );
  }
}
