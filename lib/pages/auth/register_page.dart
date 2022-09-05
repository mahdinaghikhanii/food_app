import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_firebase/module/extension.dart';
import 'package:food_firebase/module/widgets.dart';
import 'package:food_firebase/pages/auth/login_page.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/svg/icon_app.svg',
                  width: 140,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Create New Account",
                style: context.textStyle.titleLarge!.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 30),
              MEditFile(
                onChanged: (val) {},
                validator: (val) {
                  if (val!.isNotEmpty) {
                    return null;
                  } else {
                    return "name cannot be empty";
                  }
                },
                hintText: 'Full name',
                iconData: const Icon(Icons.person),
              ),
              const SizedBox(height: 15),
              MEditFile(
                onChanged: (val) {},
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                      ? null
                      : "Please enter a valid email";
                },
                hintText: 'Email',
                iconData: const Icon(Icons.email),
              ),
              const SizedBox(height: 15),
              MEditFile(
                onChanged: (val) {},
                validator: (val) {
                  if (val!.length < 6) {
                    return "password must be at least 6 characters";
                  } else {
                    return null;
                  }
                },
                hintText: 'Password',
                iconData: const Icon(Icons.password),
              ),
              const SizedBox(height: 40),
              DoneButton(text: "Sign ip", ontap: () {}),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('or continue with',
                        style: context.textStyle.labelMedium!
                            .copyWith(fontSize: 16)),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SmallIconButton(addresImage: 'assets/icon/google.png'),
                  SizedBox(width: 20),
                  SmallIconButton(addresImage: 'assets/icon/apple.png'),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: context.textStyle.labelMedium!
                              .copyWith(color: Colors.grey)),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => context.nextPage(const LoginPage()),
                        child: Text("Sign in",
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
        ));
  }
}
