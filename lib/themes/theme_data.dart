import 'package:flutter/material.dart';

class Themes {
  //light theme
  static final light = ThemeData.light().copyWith(
    textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black45),
        bodySmall: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.purpleAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      background: Colors.white,
      brightness: Brightness.light,
      surface: Colors.black,
      error: Colors.redAccent,
      onBackground: Colors.limeAccent,
      onError: Colors.deepOrangeAccent,
      onPrimary: Colors.lightBlueAccent,
      onSecondary: Colors.blue,
      onSurface: Colors.white54,
      primary: Colors.lightBlueAccent,
      secondary: Colors.blue,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.cyan),
  );
//dark theme
  static final dark = ThemeData.dark().copyWith(
    textTheme: const TextTheme().copyWith(
        bodyLarge: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
        bodySmall: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
    primaryColor: Colors.cyanAccent,
    scaffoldBackgroundColor: Colors.black,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurpleAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme(
      background: Colors.black,
      surface: Colors.white,
      error: Colors.red,
      onBackground: Colors.black,
      onError: Colors.red,
      onPrimary: Colors.deepPurple,
      onSecondary: Colors.greenAccent,
      onSurface: Colors.black38,
      primary: Colors.deepPurpleAccent,
      secondary: Colors.blueGrey,
      brightness: Brightness.dark,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.deepPurple),
  );
}
