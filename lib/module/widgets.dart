import 'package:flutter/material.dart';
import 'package:food_firebase/module/extension.dart';

class ContinueWithButton extends StatelessWidget {
  final String iconAddres;
  final String text;
  const ContinueWithButton(
      {super.key, required this.iconAddres, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300.withOpacity(0.8))),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconAddres, width: 40),
          const SizedBox(width: 20),
          Text(
            'Continue with $text',
            style: context.textStyle.labelMedium!.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const DoneButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: context.textStyle.titleLarge!
                .copyWith(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
