import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0XFF93DC12);
  static Color accentColor = const Color.fromARGB(255, 124, 175, 35);
  static ThemeData myTheme = ThemeData.light().copyWith(
    //Appbar Color
    appBarTheme: AppBarTheme(backgroundColor: primaryColor),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: accentColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: accentColor, unselectedItemColor: primaryColor),
  );
}
