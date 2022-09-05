import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              context.backPag();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
