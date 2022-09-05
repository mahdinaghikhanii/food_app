import 'package:flutter/material.dart';

class ConfigTheme {
  ThemeData themeData() {
    return ThemeData(
        dividerColor: Colors.grey.shade300.withOpacity(0.9),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        primaryColor: const Color(0xFF3AA63F),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            labelLarge: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat"),
            labelMedium: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat"),
            titleLarge: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Colors.black)));
  }
}
