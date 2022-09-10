import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:food_firebase/provider/auth_provider.dart';

import 'package:provider/provider.dart';
import 'pages/onboard_page.dart';
import 'theme/config_theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          home: const OnBoardPage()),
    );
  }
}
