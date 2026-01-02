import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  );

  return base.copyWith(
    appBarTheme: const AppBarTheme(centerTitle: false),
    cardTheme: const CardTheme(
      elevation: 0,
      margin: EdgeInsets.all(12),
    ),
  );
}
