import 'package:flutter/material.dart';
import 'package:food_firebase/helper/helper_function.dart';

class UserDataProvider with ChangeNotifier {
  String _fullname = '';
  String _emailAddres = '';

  String get fullName => _fullname;
  String get emailAddres => _emailAddres;

  getUserDataPerfs() async {
    HelperFunction.getUsername().then((value) {
      _fullname = value!;
      notifyListeners();
    });
    HelperFunction.getUserEmail().then((value) {
      _emailAddres = value!;
    });
  }
}
