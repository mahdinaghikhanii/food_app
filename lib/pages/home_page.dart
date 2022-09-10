import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';

import 'package:food_firebase/provider/userdata_provier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDataProvider>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          //    toolbarHeight: 80,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          titleSpacing: 0,
          centerTitle: false,
          title: FutureBuilder(
            future: Provider.of<UserDataProvider>(context, listen: false)
                .getUserDataPerfs(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Deliver to',
                      style: context.textStyle.bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.fullName,
                      style:
                          context.textStyle.titleLarge!.copyWith(fontSize: 17),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
