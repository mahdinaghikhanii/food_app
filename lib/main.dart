import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'helper/helper_function.dart';
import 'pages/home_page.dart';
import 'provider/auth_provider.dart';

import 'package:provider/provider.dart';

import 'pages/onboard_page.dart';
import 'theme/config_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool logged = false;

  HelperFunction.getUserLogged().then((value) {
    if (value != null) {
      logged = value;
    }
  });

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(isSignedIn: logged));
}

class MyApp extends StatelessWidget {
  final bool isSignedIn;
  const MyApp({super.key, required this.isSignedIn});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ConfigTheme().themeData(),
          home: isSignedIn == false ? const OnBoardPage() : const HomePage()),
    );
  }
}
