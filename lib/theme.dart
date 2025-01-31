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
  primaryColor: const Color.fromARGB(255, 15, 78, 130),
  scaffoldBackgroundColor: const Color.fromARGB(255, 37, 37, 37), // Hardcoded Dark Background
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: const Color.fromARGB(255, 13, 85, 144),
    onPrimary: Colors.white,
    surface: const Color.fromARGB(255, 57, 57, 57)!, // Ensure background is grey
    onSurface: Colors.white,
  ),
);  
