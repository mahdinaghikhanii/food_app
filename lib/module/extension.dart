import 'package:flutter/material.dart';

extension BuildExtension on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;

  void nextPage(Widget child) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => child));
  }

  void backPag() {
    Navigator.pop(this);
  }
}
