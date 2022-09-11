// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_firebase/services/database_service.dart';

import '../../helper/helper_function.dart';
import '../../module/widgets.dart';
import '../../pages/home_page.dart';
import '../../services/auth_service.dart';
import '../module/extension.dart';

class AuthProvider with ChangeNotifier {
  bool _isloading = false;
  bool get loading => _isloading;
  bool setLoading(bool check) => _isloading = check;

  Future loginUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    _isloading = true;
    AuthServices()
        .signinUserWithEmailAndPassword(email, password)
        .then((value) async {
      if (value == true) {
        _isloading = false;
        QuerySnapshot querySnapshot =
            await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .getingUserData(email);
        await HelperFunction.saveUserLogged(true);
        await HelperFunction.saveUserName(querySnapshot.docs[0]['fullName']);
        await HelperFunction.saveEmail(email);
        context.nextPageAndRep(const HomePage());
      } else {
        _isloading = false;
        showSnackbar(context, Colors.red, value);
      }
    });
    notifyListeners();
  }

  Future createUserWithEmailAndPasswordAndFullname(BuildContext context,
      String email, String password, String fullname) async {
    _isloading = true;
    AuthServices()
        .registerUserWithEmailAndPassword(email, password, fullname)
        .then((value) async {
      if (value == true) {
        _isloading = false;
        context.nextPageAndRep(const HomePage());
        await HelperFunction.saveUserLogged(true);
        await HelperFunction.saveEmail(email);
        await HelperFunction.saveUserName(fullname);
      } else {
        _isloading = false;
        showSnackbar(context, Colors.red, value);
      }
    });
    notifyListeners();
  }
}
