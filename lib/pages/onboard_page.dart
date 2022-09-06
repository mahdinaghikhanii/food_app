import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.grey.shade800,
      overrideNext: Text('', style: TextStyle(color: Colors.grey.shade800)),
      isTopSafeArea: true, // Safe Area to avoid overlaps with the status bar
      showDoneButton: true,

      done: const Text('done', style: TextStyle(color: Colors.white)),

      doneStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
      ),
      //doneStyle: ButtonStyle(),
      back: const Text("Back", style: TextStyle(color: Colors.white)),
      next: const Icon(Icons.arrow_forward),
      nextFlex: 0,

      skipStyle: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.grey.shade800)),
      showNextButton: true,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onDone: () {
        /// going login screans
        ///
      },

      // A skip button to skip those pages(some prefer some doesn't)
      showSkipButton: true,

      skip: const Text('Skip', style: TextStyle(color: Colors.white)),

      // Same here, if the user skips - redirects to loginPage

      // Now pages expect a list of PageViewModel
      // That's what we have added here
      pages: [
        PageViewModel(
          image: Lottie.asset('assets/img/food.png',
              fit: BoxFit.contain, height: 400),
          body: "Freedom talk to any person with assured privacy",
          title: "Order for Food",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18)),
          // title:
        ),
        PageViewModel(
          image: Lottie.asset("assets/img/payment.png", height: 300),
          body: "Send text, images, videos and even documents to your friends",
          title: "Easy Payment",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18)),
        ),
        PageViewModel(
          image: Lottie.asset("assets/img/delivery.png", height: 400),
          body: "Fast Delivery",
          decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
              bodyTextStyle: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ],
    );
  }
}
