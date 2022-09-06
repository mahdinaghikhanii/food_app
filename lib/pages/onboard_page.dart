import 'package:flutter/material.dart';
import '../module/extension.dart';
import 'letsyouin_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,

      isTopSafeArea: true, // Safe Area to avoid overlaps with the status bar
      showDoneButton: true,

      done: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('done',
            style:
                context.textStyle.labelMedium!.copyWith(color: Colors.white)),
      ),

      doneStyle: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF3AA63F)),
      ),
      //doneStyle: ButtonStyle(),

      //rtl: true, // Display as right-to-left

      back: const Icon(Icons.arrow_back),
      backStyle: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF3AA63F)),
      ),

      next: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Next",
          style: context.textStyle.labelMedium!.copyWith(color: Colors.white),
        ),
      ),
      nextStyle: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF3AA63F))),

      skipStyle: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFF3AA63F))),
      showNextButton: true,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

      onDone: () {
        context.nextPage(const LetsYouIm());
      },
      showSkipButton: true,
      skip: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Skip',
          style: context.textStyle.labelMedium!.copyWith(color: Colors.white),
        ),
      ),
      pages: [
        PageViewModel(
          image: Image.asset('assets/img/food.png',
              fit: BoxFit.contain, height: 280),
          body: "Freedom talk to any person with assured privacy",
          title: "Order for Food",
          decoration: PageDecoration(
              titleTextStyle: context.textStyle.titleLarge!
                  .copyWith(color: const Color(0xFF3AA63F))),
          // title:
        ),
        PageViewModel(
            image: Image.asset("assets/img/payment.png", height: 300),
            body:
                "Send text, images, videos and even documents to your friends",
            title: "Easy Payment",
            decoration: PageDecoration(
                titleTextStyle: context.textStyle.titleLarge!
                    .copyWith(color: const Color(0xFF3AA63F)))),
        PageViewModel(
          image: Image.asset("assets/img/delivery.png", height: 400),
          body: "Fast Delivery",
          title: "Fast Delivery",
          decoration: PageDecoration(
              titleTextStyle: context.textStyle.titleLarge!
                  .copyWith(color: const Color(0xFF3AA63F)),
              bodyTextStyle: context.textStyle.titleMedium!.copyWith()),
        ),
      ],
    );
  }
}
