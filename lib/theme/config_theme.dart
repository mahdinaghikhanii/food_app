import 'package:flutter/material.dart';

class ConfigTheme {
  ThemeData themeData() {
    return ThemeData(
        inputDecorationTheme: const InputDecorationTheme(),
        dividerColor: Colors.grey.shade400.withOpacity(0.9),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        primaryColor: const Color(0xFF3AA63F),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              color: Colors.red,
            )),
        textTheme: const TextTheme(
            bodySmall: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat"),
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
