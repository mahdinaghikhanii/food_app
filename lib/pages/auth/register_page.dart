import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              context.backPag();
            },
            child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
