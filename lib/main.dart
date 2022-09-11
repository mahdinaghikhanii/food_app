// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'
    show FlutterNativeSplash;
import 'package:food_firebase/provider/userdata_provier.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'helper/helper_function.dart';
import 'pages/home_page.dart';
import 'pages/onboard_page.dart';
import 'provider/auth_provider.dart';
import 'theme/config_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool logged = false;
  HelperFunction.getUserLogged().then((value) {
    if (value != null) {
      logged = value;
    }
  });
  //FlutterNativeSplash.remove();
  FlutterNativeSplash.removeAfter(ini);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp(isSignedIn: logged));
}

Future ini(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  final bool isSignedIn;

  const MyApp({super.key, required this.isSignedIn});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserDataProvider>(
            create: (context) => UserDataProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ConfigTheme().themeData(),
          home: isSignedIn == false ? const OnBoardPage() : const HomePage()),
    );
  }
}
