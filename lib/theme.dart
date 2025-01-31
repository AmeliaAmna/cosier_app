import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white, // Hardcoded Light Background
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 55, 57, 59),
    onPrimary: Colors.white,
    surface: Colors.white, // Ensure background is white
    onSurface: Color.fromARGB(255, 23, 22, 22),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[900], // Hardcoded Dark Background
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Colors.blue,
    onPrimary: Colors.white,
    surface: Colors.grey[900]!, // Ensure background is grey
    onSurface: Colors.white,
  ),
);
