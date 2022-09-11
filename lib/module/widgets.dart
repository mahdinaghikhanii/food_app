import 'package:flutter/material.dart';
import '../model/category_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'extension.dart';

class ContinueWithButton extends StatelessWidget {
  final String iconAddres;
  final String text;
  final VoidCallback ontap;
  const ContinueWithButton(
      {super.key,
      required this.iconAddres,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade300.withOpacity(0.8))),
        height: 55,
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
  final TextEditingController controller;
  final Function(String val) onChanged;
  final String? Function(String? onChange)? validator;
  const MEditFile(
      {super.key,
      required this.onChanged,
      required this.hintText,
      required this.controller,
      this.validator,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 18, color: Colors.grey),
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: iconData,
          prefixIconColor: Colors.grey.withOpacity(0.9),
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          enabled: true,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2),
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

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
        textColor: Colors.white,
      )));
}

class MLoading extends StatelessWidget {
  final double? size;
  const MLoading({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
          color: Theme.of(context).primaryColor, size: size ?? 60),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const SubTitle({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: context.textStyle.titleLarge!.copyWith(fontSize: 16),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ontap,
          child: Text(
            'See All',
            style: context.textStyle.titleLarge!
                .copyWith(fontSize: 15, color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}

class DiscountIteams extends StatelessWidget {
  const DiscountIteams({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 0)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(
                    "assets/img/fish.png",
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  ),
                )),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Soshi",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle.titleLarge!.copyWith(fontSize: 16)),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Text('1.5 km',
                        style: context.textStyle.bodySmall!.copyWith(
                            fontSize: 10, color: Colors.grey.shade700)),
                    VerticalDivider(
                        thickness: 1,
                        endIndent: 2,
                        indent: 2,
                        width: 10,
                        color: Colors.grey.shade700),
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    const SizedBox(width: 5),
                    Text('4.8',
                        style: context.textStyle.bodySmall!.copyWith(
                            fontSize: 10, color: Colors.grey.shade700)),
                    const SizedBox(width: 5),
                    Text("(1.2k)",
                        style: context.textStyle.bodySmall!.copyWith(
                            fontSize: 10, color: Colors.grey.shade700)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Text('\$6.00',
                        style: context.textStyle.titleLarge!.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor)),
                    VerticalDivider(
                        thickness: 1,
                        endIndent: 6,
                        indent: 6,
                        width: 10,
                        color: Colors.grey.shade700),
                    Icon(Icons.motorcycle,
                        color: Theme.of(context).primaryColor, size: 18),
                    const SizedBox(width: 5),
                    Text("\$2.00",
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyle.bodySmall!.copyWith(
                            fontSize: 10, color: Colors.grey.shade700)),
                    const Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildChip extends StatelessWidget {
  const BuildChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> choice = [
      CategoryModel("assets/img/done.png", "All"),
      CategoryModel("assets/img/burger.png", "Burger"),
      CategoryModel("assets/img/drink.png", "Drink"),
      CategoryModel("assets/img/helthe.png", "Vegan"),
      CategoryModel("assets/img/spageti.png", "spageti"),
      CategoryModel("assets/img/icons8-cake-48.png", "Dessert"),
      CategoryModel("assets/img/pitzza.png", "Pizza"),
      CategoryModel("assets/img/noodles.png", "Noodles"),
      CategoryModel("assets/img/more.png", "More"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: choice.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: ChoiceChip(
              avatar: Image.asset(choice[index].imgAddres),
              backgroundColor: Colors.white,
              label: Text(choice[index].name,
                  style: context.textStyle.titleLarge!.copyWith(fontSize: 16)),
              selectedColor: Theme.of(context).primaryColor,
              //     selected: choiceProvider.currentIndexBuildChip == index,
              selected: false,
              onSelected: (value) {
                //  choiceProvider.setcurrentIndexBuildChip(index, value);
              },
            ),
          );
        },
      ),
    );
  }
}

class RecommendedForYouIteam extends StatelessWidget {
  const RecommendedForYouIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(1, 0)),
          ],
        ),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: Image.asset(
                "assets/img/fish.png",
                fit: BoxFit.cover,
                height: 120,
                width: 140,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Text("Soshi",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style:
                          context.textStyle.titleLarge!.copyWith(fontSize: 16)),
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text('1.5 km',
                          style: context.textStyle.bodySmall!.copyWith(
                              fontSize: 12, color: Colors.grey.shade700)),
                      VerticalDivider(
                          thickness: 1,
                          endIndent: 2,
                          indent: 2,
                          width: 10,
                          color: Colors.grey.shade700),
                      const Icon(Icons.star, size: 18, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text('4.8',
                          style: context.textStyle.bodySmall!.copyWith(
                              fontSize: 12, color: Colors.grey.shade700)),
                      const SizedBox(width: 5),
                      Text("(1.2k)",
                          style: context.textStyle.bodySmall!.copyWith(
                              fontSize: 12, color: Colors.grey.shade700)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(Icons.motorcycle,
                            color: Theme.of(context).primaryColor, size: 20),
                        const SizedBox(width: 5),
                        Text("\$2.00",
                            overflow: TextOverflow.ellipsis,
                            style: context.textStyle.bodySmall!.copyWith(
                                fontSize: 12, color: Colors.grey.shade700)),
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 22,
                      color: Colors.red,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
