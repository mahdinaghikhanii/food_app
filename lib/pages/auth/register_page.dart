import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../module/extension.dart';
import '../../module/widgets.dart';
import '../../provider/auth_provider.dart';

TextEditingController _fullname = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final register = Provider.of<AuthProvider>(context);
    final fromKey = GlobalKey<FormState>();

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
          child: Form(
            key: fromKey,
            child: ListView(
              children: [
                Center(
                  child: Image.asset(
                    'assets/img/icon_app.png',
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
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "name cannot be empty";
                    }
                  },
                  onChanged: (val) {},
                  hintText: 'Full name',
                  iconData: const Icon(Icons.person),
                  controller: _fullname,
                ),
                const SizedBox(height: 15),
                MEditFile(
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                  onChanged: (val) {},
                  hintText: 'Email',
                  iconData: const Icon(Icons.email),
                  controller: _email,
                ),
                const SizedBox(height: 15),
                MEditFile(
                  validator: (val) {
                    if (val!.length < 6) {
                      return "password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {},
                  hintText: 'Password',
                  iconData: const Icon(Icons.password),
                  controller: _password,
                ),
                const SizedBox(height: 40),
                register.loading == false
                    ? DoneButton(
                        text: "Sign ip",
                        ontap: () {
                          if (fromKey.currentState!.validate()) {
                            register.createUserWithEmailAndPasswordAndFullname(
                                context,
                                _email.text,
                                _password.text,
                                _fullname.text);
                          }
                        })
                    : const MLoading(),
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
                const SizedBox(height: 15),
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
                          onTap: () {},
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
          ),
        ));
  }
}
