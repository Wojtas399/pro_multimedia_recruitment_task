import 'package:flutter/material.dart';

class CustomTheme {
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF306FAA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0568B0),
        ),
      );
}
