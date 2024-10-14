import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/main.dart';
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
                        color: ColorsClass.darkRed.withOpacity(0.3),
                        width: 2))),
            padding: EdgeInsets.symmetric(
              horizontal: CustomMethods.mediaWidth(context, 20),
            ),
            width: double.infinity,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, -CustomMethods.mediaWidth(context, 7)),
                  child: Image(
                    image: const AssetImage(ImgPath.recipe),
                    height: CustomMethods.mediaWidth(context, 1),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidgets.height(context, 1.4),
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 14),
                            fontFamily: "Fredoka"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Explore a world of food! Click any type of food to see the options.",
                              style: TextStyle(
                                  color: ColorsClass.black.withOpacity(0.5),
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 20),
                                  fontFamily: "Fredoka"),
                            ),
                          ),
                          CustomWidgets.width(context, 10)
                        ],
                      ),
                      CustomWidgets.height(context, 25),
                      Expanded(
                          child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1 / 1,
                          crossAxisSpacing:
                              CustomMethods.mediaWidth(context, 30),
                          mainAxisSpacing:
                              CustomMethods.mediaWidth(context, 50),
                        ),
                        itemCount: provider.mealCategories.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.push("/meal_options");
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorsClass.darkRed
                                          .withOpacity(0.18)),
                                  child: FadeInImage(
                                    placeholderFit: BoxFit.scaleDown,
                                    placeholder:
                                        const AssetImage(ImgPath.placeholder2),
                                    image: NetworkImage(provider
                                        .mealCategories[index]
                                        .strCategoryThumb),
                                    fit: BoxFit.cover,
                                    fadeInDuration:
                                        const Duration(milliseconds: 2),
                                    fadeInCurve: Curves.easeInCirc,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              provider.mealCategories[index].strCategory,
                              style: TextStyle(
                                  color: ColorsClass.black,
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 20),
                                  fontFamily: "Fredoka"),
                            ),
                            CustomWidgets.height(context, 70),
                          ],
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ))),
    );
  }
}
