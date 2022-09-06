// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:food_firebase/provider/validation/validation_iteam.dart';

class RegisterValidation extends ChangeNotifier {
  ValidationIteam _fullname = ValidationIteam('', '');
  ValidationIteam _email = ValidationIteam('', '');
  ValidationIteam _passwords = ValidationIteam('', '');

  ValidationIteam get fullname => _fullname;
  ValidationIteam get email => _email;
  ValidationIteam get password => _passwords;

  bool get isValid {
    if (_fullname.value != null && _email.value != null && _passwords != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeFullname(String fullname) {
    if (fullname.length > 3) {
      _fullname = ValidationIteam("", fullname);
    } else {
      _fullname = ValidationIteam("Must be at least 3 characters", fullname);
    }
    notifyListeners();
  }

  void changeEmail(String emailAddres) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailAddres)) {
      _email = ValidationIteam("Please enter a valid emai", "");
    } else if (emailAddres == null) {
      _email = ValidationIteam("Please enter a valid emai", "");
    } else {
      _email = ValidationIteam("", emailAddres);
    }
  }

  void changePassword(String password) {
    if (password.length < 6) {
      _passwords =
          ValidationIteam("password must be at least 6 characters", "");
    } else {
      _passwords = ValidationIteam('', password);
    }
  }
}
