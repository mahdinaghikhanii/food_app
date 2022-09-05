import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
