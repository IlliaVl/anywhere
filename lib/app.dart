import 'package:anywhere/flavor.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(
        title: flavor.appName,
      ),
    );
  }
}
