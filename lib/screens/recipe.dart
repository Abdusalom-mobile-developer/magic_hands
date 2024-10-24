import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
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
              type: BottomNavigationBarType.fixed,
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
                    icon: Icon(
                      Icons.menu_book_rounded,
                    ),
                    label: "Options"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.restaurant_menu_rounded,
                    ),
                    label: "Recipe"),
              
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
                                image: NetworkImage(provider
                                    .chosenOption["strMealThumb"]
                                    .toString()
                                    .trim()),
                                fit: BoxFit.cover)),
                      )),
                  Transform.translate(
                    offset: Offset(0, -CustomMethods.mediaWidth(context, 40)),
                    child: Container(
                      height: CustomMethods.mediaWidth(context, 40),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: ColorsClass.bgColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
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
                              offset: const Offset(0, -5),
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
                                          provider.chosenOption["strMeal"]
                                              .toString()
                                              .trim(),
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
                                            provider.chosenOption["strArea"]
                                                .toString()
                                                .trim(),
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
                                    padding: EdgeInsets.all(
                                        CustomMethods.mediaWidth(context, 130)),
                                    decoration: BoxDecoration(
                                        color: ColorsClass.darkRed
                                            .withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height:
                                        CustomMethods.mediaHeight(context, 15),
                                    width: CustomMethods.mediaWidth(context, 7),
                                    child: Image(
                                      image: NetworkImage(
                                          provider.currentCategoryImg),
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
                            Column(
                              children: provider.listOfRowMakerIngredients,
                            ),
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
                              provider.chosenOption["strInstructions"]
                                  .toString()
                                  .trim(),
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
