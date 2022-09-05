import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';
import 'package:lottie/lottie.dart';

class LetsYouIm extends StatelessWidget {
  const LetsYouIm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/lottie/welcome.json',
              width: 300, height: 300),
          const SizedBox(height: 20),
          Text(
            'Let\'s you in',
            style: context.textStyle.titleLarge,
          )
        ],
      ),
    );
  }
}
