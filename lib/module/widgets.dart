import 'package:flutter/material.dart';
import 'extension.dart';

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

class MEditFile extends StatelessWidget {
  final String hintText;
  final Icon iconData;
  final Function(String? val) onChanged;
  final String? Function(String? onChange)? validator;
  const MEditFile(
      {super.key,
      required this.onChanged,
      required this.validator,
      required this.hintText,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 18, color: Colors.grey),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: iconData,
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey.withOpacity(0.0), width: 0),
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), gapPadding: 18),
          labelText: hintText,
          hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
          labelStyle: context.textStyle.labelMedium!.copyWith(
            color: Colors.black.withOpacity(0.4),
            fontSize: 16,
          ),
        ),
        obscureText: false);
  }
}

class SmallIconButton extends StatelessWidget {
  final String addresImage;
  const SmallIconButton({super.key, required this.addresImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Image.asset(addresImage, width: 30),
    );
  }
}
