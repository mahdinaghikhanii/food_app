import 'package:flutter/material.dart';
import '../module/extension.dart';
import '../module/widgets.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';
import 'home_page.dart';
import '../services/auth_service.dart';
import 'package:lottie/lottie.dart';

class LetsYouIm extends StatelessWidget {
  const LetsYouIm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              context.backPag();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: LottieBuilder.asset(
                              'assets/lottie/welcome.json',
                              width: 250,
                              height: 250),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Let\'s you in',
                          style: context.textStyle.titleLarge!
                              .copyWith(fontSize: 38),
                        ),
                        const SizedBox(height: 30),
                        ContinueWithButton(
                            iconAddres: 'assets/icon/google.png',
                            text: 'Google',
                            ontap: () {
                              AuthServices().signInWithGoogle().then((value) =>
                                  context.nextPageAndRep(const HomePage()));
                            }),
                        const SizedBox(height: 15),
                        ContinueWithButton(
                            iconAddres: 'assets/icon/apple.png',
                            text: 'apple',
                            ontap: () {}),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(child: Divider()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('or',
                                  style: context.textStyle.labelMedium!
                                      .copyWith(fontSize: 16)),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        DoneButton(
                            text: "Sign in with email",
                            ontap: () {
                              context.nextPage(const LoginPage());
                            }),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?',
                                style: context.textStyle.labelMedium!
                                    .copyWith(color: Colors.grey)),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () =>
                                  context.nextPage(const RegisterPage()),
                              child: Text("Sign up",
                                  style: context.textStyle.labelLarge!.copyWith(
                                    color: const Color(0xFF3AA63F),
                                    fontSize: 14,
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(height: 10)
                      ],
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }
}
