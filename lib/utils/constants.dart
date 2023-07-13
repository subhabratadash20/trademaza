import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //App related strings
  static String appName = "Manga App";

  //Colors for theme
  static Color lightPrimary = const Color(0xfff3f4f9);
  static Color darkPrimary = const Color(0xff2B2B2B);
  static Color darksecondary = const Color.fromARGB(137, 26, 25, 25);
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red;
  static Color lightBG = const Color.fromARGB(255, 237, 237, 237);
  static Color darkBG = const Color.fromARGB(255, 109, 109, 109);
  static Color defaultBottonColor = const Color(0xFF4157FF);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: lightPrimary,
    secondaryHeaderColor: const Color.fromARGB(255, 14, 99, 168),
    primaryColorLight: Colors.black87,
    primaryColorDark: const Color.fromARGB(255, 237, 237, 237),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: lightBG,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ).titleLarge,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: lightBG,
      unselectedItemColor: Colors.black,
      selectedItemColor: defaultBottonColor,
      // selectedIconTheme: IconThemeData(color: defaultBottonColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 3,
      color: lightBG,
    ),
    shadowColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.overpassTextTheme(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
  );
// Dart Theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    shadowColor: Colors.white24,
    secondaryHeaderColor: Colors.white,
    primaryColorLight: Colors.white70,
    primaryColorDark: const Color.fromARGB(255, 30, 30, 30),
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.overpassTextTheme(),
    appBarTheme: AppBarTheme(
      color: darkBG,
      elevation: 0,
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ).bodyMedium,
      titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ).titleLarge,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: darkBG,
      unselectedItemColor: Colors.white,
      selectedItemColor: defaultBottonColor,

      // selectedIconTheme: IconThemeData(color: defaultBottonColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 3,
      color: darkBG,
    ),
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
  );
}
