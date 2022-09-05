import 'package:flutter/material.dart';
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
          const Text('Let\'s you in')
        ],
      ),
    );
  }
}
