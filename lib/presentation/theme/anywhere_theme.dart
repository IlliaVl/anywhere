import 'package:flutter/material.dart';

class AnywhereTheme {
  static get light {
    final theme = ThemeData.light();
    return theme.copyWith(
      textTheme: TextTheme(
        titleMedium: _titleMedium(theme),
        bodyMedium: _bodyMedium(theme),
      ),
    );
  }

  static get dark {
    final theme = ThemeData.dark();
    return theme.copyWith(
      textTheme: TextTheme(
        titleMedium: _titleMedium(theme),
        bodyMedium: _bodyMedium(theme),
      ),
    );
  }

  static TextStyle? _titleMedium(ThemeData themeData) =>
      themeData.textTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle? _bodyMedium(ThemeData themeData) =>
      themeData.textTheme.bodyMedium?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
}
