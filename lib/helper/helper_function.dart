import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userLoggedInKey = "USERLOGEDKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  /// saving user name to local phone
  static Future<bool> saveUserName(String fullname) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(userNameKey, fullname);
  }

  /// saving user Email to local phone
  static Future<bool> saveEmail(String email) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userEmailKey, email);
  }

  /// saving user logged and
  static Future<bool> saveUserLogged(bool logged) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(userLoggedInKey, logged);
  }

  static Future<bool?> getUserLogged() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(userLoggedInKey);
  }
}
