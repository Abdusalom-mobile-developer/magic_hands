import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(
      builder: (context, provider, child) => Scaffold(
          backgroundColor: ColorsClass.bgColor,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.bottomNavigationBarIndex,
              backgroundColor: ColorsClass.bgColor,
              onTap: (value) {
                provider.changeCurrentIndex(value, context);
              },
              unselectedItemColor: ColorsClass.black,
              selectedItemColor: ColorsClass.darkRed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood_rounded), label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ]),
          body: SafeArea(
              child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorsClass.black.withOpacity(0.5),
                        width: 1.3))),
            padding: EdgeInsets.symmetric(
              horizontal: CustomMethods.mediaWidth(context, 20),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomWidgets.height(context, 3),
                Text(
                  "Categories",
                  style: TextStyle(
                      color: ColorsClass.black,
                      fontSize: CustomMethods.mediaWidth(context, 14),
                      fontFamily: "Fredoka"),
                ),
                Text(
                  "Click to see all food options belongs to that country",
                  style: TextStyle(
                      color: ColorsClass.black.withOpacity(0.5),
                      fontSize: CustomMethods.mediaWidth(context, 20),
                      fontFamily: "Fredoka"),
                ),
                CustomWidgets.height(context, 25),
                Expanded(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2 / 1,
                    crossAxisSpacing: CustomMethods.mediaWidth(context, 30),
                    mainAxisSpacing: CustomMethods.mediaWidth(context, 50),
                  ),
                  itemCount: provider.categoriesInfo.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      provider.categoriesInfo[index].imgPath),
                                  fit: BoxFit.cover),
                              color: ColorsClass.bgColor,
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  colors: [
                                    Colors.black.withOpacity(0.18),
                                    Colors.black.withOpacity(0.2)
                                  ]),
                            ))),
                      ),
                      Text(
                        provider.categoriesInfo[index].name,
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 20),
                            fontFamily: "Fredoka"),
                      ),
                      CustomWidgets.height(context, 70),
                    ],
                  ),
                )),
              ],
            ),
          ))),
    );
  }
}
