import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';

import '../../helper/helper_function.dart';
import '../../module/widgets.dart';
import '../../pages/home_page.dart';
import '../../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isloading = false;
  bool get loading => _isloading;
  bool setLoading(bool check) => _isloading = check;

  void loginUser(BuildContext context, String email, String password) async {
    AuthServices()
        .signinUserWithEmailAndPassword(email, password)
        .then((value) async {
      if (value == true) {
        context.nextPageAndRep(const HomePage());
        await HelperFunction.saveUserLogged(true);
        await HelperFunction.saveEmail(email);
      } else {
        showSnackbar(context, Colors.red, value);
      }
    });
  }
}
