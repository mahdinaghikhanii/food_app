// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';
import 'package:food_firebase/module/widgets.dart';
import 'package:food_firebase/pages/home_page.dart';
import 'package:food_firebase/provider/validation/validation_iteam.dart';
import 'package:food_firebase/services/auth_service.dart';

class RegisterValidation with ChangeNotifier {
  ValidationIteam _fullname = ValidationIteam('', '');
  ValidationIteam _email = ValidationIteam('', '');
  ValidationIteam _passwords = ValidationIteam('', '');

  ValidationIteam get fullname => _fullname;
  ValidationIteam get email => _email;
  ValidationIteam get password => _passwords;

  ValidationIteam setFullname(String name) =>
      _fullname = ValidationIteam("", name);
  ValidationIteam setEmail(String email) => _email = ValidationIteam("", email);
  ValidationIteam setPassword(String password) =>
      _passwords = ValidationIteam("", password);

  bool get isValid {
    if (_fullname.value != null &&
        _email.value != null &&
        _passwords.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeFullname(String fullname) {
    if (fullname.length >= 3) {
      _fullname = ValidationIteam('', fullname);
    } else {
      _fullname = ValidationIteam("Must be at least 3 characters", '');
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
    notifyListeners();
  }

  void changePassword(String password) {
    if (password.length <= 4) {
      _passwords =
          ValidationIteam("password must be at least 6 characters", "");
    } else {
      _passwords = ValidationIteam('', password);
    }
    notifyListeners();
  }

  void submitDataRegister(BuildContext context) async {
    AuthServices()
        .registerUserWithEmailAndPassword(
            fullname.value, password.value, fullname.value)
        .then((value) {
      if (value == true) {
        context.nextPage(const HomePage());
      } else {
        showSnackbar(context, Colors.red, value);
      }
    });
  }

  void submitData() {
    print(
        "FirstName: ${fullname.value}, LastName: ${email.value}, ${password.value}");
  }
}
