import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue, // Example primary color
    scaffoldBackgroundColor: Colors.grey.shade100,
    colorScheme: ColorScheme.light(
      primary: Colors.black87,
      secondary: Color(0xFF0052A4), // Example secondary color
      onPrimary: Colors.white, // Text on primary color
      onSecondary: Colors.black, // Text on secondary color
      surface: Colors.white, // Card backgrounds, etc.
      onSurface: Colors.black, // Text on surface
      background: Colors.grey.shade100,
      onBackground: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal, // Example primary color for dark theme
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
      primary: Colors.teal,
      secondary: Colors.amber, // Example secondary color for dark theme
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      surface: Colors.grey.shade800,
      onSurface: Colors.white,
      background: Colors.grey.shade900,
      onBackground: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
