import 'package:flutter/material.dart';

class ConfigTheme {
  ThemeData themeData() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        primaryColor: const Color(0xFF3AA63F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Colors.black)));
  }
}
