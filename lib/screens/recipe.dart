import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(
        builder: (context, provider, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: provider.bottomNavigationBarIndex,
                backgroundColor: ColorsClass.bgColor,
                onTap: (value) {
                  provider.changeCurrentIndex(value, context);
                },
                unselectedItemColor: ColorsClass.black,
                selectedItemColor: ColorsClass.darkRed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.fastfood_rounded), label: "Categories"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ]),
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorsClass.bgColor,
            body: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorsClass.darkRed.withOpacity(0.3),
                          width: 2))),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    provider.recomendations[6].strMealThumb),
                                fit: BoxFit.cover)),
                      )),
                  Transform.translate(
                    offset: const Offset(0, -7),
                    child: Container(
                      height: CustomMethods.mediaWidth(context, 30),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: ColorsClass.bgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: ColorsClass.bgColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.recomendations[6].strMeal,
                                          style: TextStyle(
                                              color: ColorsClass.black,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 14),
                                              fontFamily: "Fredoka"),
                                        ),
                                        Transform.translate(
                                          offset: Offset(
                                              0,
                                              -CustomMethods.mediaWidth(
                                                  context, 70)),
                                          child: Text(
                                            "Japanese",
                                            style: TextStyle(
                                                color: ColorsClass.black
                                                    .withOpacity(0.5),
                                                fontSize:
                                                    CustomMethods.mediaWidth(
                                                        context, 20),
                                                fontFamily: "Fredoka"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                        color: ColorsClass.darkRed
                                            .withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height:
                                        CustomMethods.mediaHeight(context, 13),
                                    width: CustomMethods.mediaWidth(context, 6),
                                    child: Image(
                                      image: NetworkImage(provider
                                          .mealCategories[4].strCategoryThumb),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CustomWidgets.height(context, 40),
                            Text(
                              "Ingredients",
                              style: TextStyle(
                                  color: ColorsClass.black,
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 18),
                                  fontFamily: "Fredoka"),
                            ),
                            CustomWidgets.height(context, 90),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.ingredientsRowMaker(context),
                            CustomWidgets.height(context, 40),
                            Text(
                              "Instruction",
                              style: TextStyle(
                                  color: ColorsClass.black,
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 18),
                                  fontFamily: "Fredoka"),
                            ),
                            CustomWidgets.height(context, 100),
                            Text(
                              "Add a small pinch of salt and sesame oil to minced beef. Mix well and set aside. Mix 1 tablespoon of cornstarch with 2 and ½ tablespoons of water in a small bowl to make water starch. Cut tofu into square cubes (around 2cms). Bring a large amount of water to a boil and then add a pinch of salt. Slide the tofu in and cook for 1 minute. Move out and drain. Get a wok and heat up around 2 tablespoons of oil, fry the minced meat until crispy. Transfer out beef out and leave the oil in. Fry doubanjiang for 1 minute over slow fire and then add garlic, scallion white, ginger and fermented black beans to cook for 30 seconds until aroma. Then mix pepper flakes in. Add water to the seasonings and bring to boil over high fire. Gently slide the tofu cubes. Add light soy sauce and beef.Slow the heat after boiling and then simmer for 6-8 minutes. Then add chopped garlic greens.Stir the water starch and then pour half of the mixture to the simmering pot. Wait for around 30 seconds and then pour the other half. You can slightly taste the tofu and add pinch of salt if not salty enough. By the way, if you feel it is too spicy, add some sugar can milder the taste. But be carefully as the broth is very hot at this point.Transfer out when almost all the seasonings stick to tofu cubes. Sprinkle Szechuan peppercorn powder (to taste)and chopped garlic greens if using.Serve immediately with steamed rice.",
                              style: TextStyle(
                                  color: ColorsClass.black.withOpacity(0.5),
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 21),
                                  fontFamily: "Fredoka"),
                            ),
                            CustomWidgets.height(context, 30),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
