import 'package:flutter/material.dart';
import '../model/category_model.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

import '../provider/userdata_provier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = [
      CategoryModel("assets/img/burger.png", "Burger"),
      CategoryModel("assets/img/drink.png", "Drink"),
      CategoryModel("assets/img/helthe.png", "Vegan"),
      CategoryModel("assets/img/spageti.png", "spageti"),
      CategoryModel("assets/img/icons8-cake-48.png", "Dessert"),
      CategoryModel("assets/img/pitzza.png", "Pizza"),
      CategoryModel("assets/img/noodles.png", "Noodles"),
      CategoryModel("assets/img/more.png", "More"),
    ];
    final user = Provider.of<UserDataProvider>(context, listen: false);
    TextEditingController search = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context);
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          showSelectedLabels: true,
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          selectedLabelStyle: const TextStyle(fontSize: 14),
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (va) {},
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Others", icon: Icon(Icons.pause_presentation_sharp)),
            BottomNavigationBarItem(
                label: "Message", icon: Icon(Icons.message)),
            BottomNavigationBarItem(
                label: "E-Wallet", icon: Icon(Icons.wallet)),
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.person))
          ],
        ),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.grey.shade300.withOpacity(0.8))),
                child: const Icon(Icons.card_travel),
              ),
            ),
          ],
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
                          context.textStyle.titleLarge!.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MEditFile(
                    onChanged: (va) {},
                    hintText: "What are you craving?",
                    controller: search,
                    iconData: const Icon(Icons.search)),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SubTitle(title: 'Special offers', ontap: () {})),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset('assets/img/off.png'),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 15,
                              crossAxisCount: 4),
                      itemCount: category.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Image.asset(category[index].imgAddres),
                            const SizedBox(height: 8),
                            Text(category[index].name),
                          ],
                        );
                      })),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SubTitle(title: 'Discount Guaranteed! 👌', ontap: () {}),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 290,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return const DiscountIteams();
                      })),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      SubTitle(title: 'Recommended For You 😍', ontap: () {})),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: BuildChip(),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return const RecommendedForYouIteam();
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
