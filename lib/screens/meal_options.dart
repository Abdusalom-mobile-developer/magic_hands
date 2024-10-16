import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:provider/provider.dart';

class MealOptions extends StatelessWidget {
  const MealOptions({super.key});

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
            backgroundColor: ColorsClass.bgColor,
            body: SafeArea(
                child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorsClass.darkRed.withOpacity(0.3),
                          width: 2))),
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: CustomMethods.mediaWidth(context, 28)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomWidgets.height(context, 20),
                          Text(
                            provider.mealCategories[4].strCategory,
                            style: TextStyle(
                                color: ColorsClass.black,
                                fontSize: CustomMethods.mediaWidth(context, 14),
                                fontFamily: "Fredoka"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: CustomMethods.mediaWidth(context, 30)),
                            child: Text(
                              "Select a meal to see the ingredients and cooking instructions.",
                              style: TextStyle(
                                  color: ColorsClass.black.withOpacity(0.5),
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 20),
                                  fontFamily: "Fredoka"),
                            ),
                          ),
                          CustomWidgets.height(context, 20),
                        ],
                      ),
                    )
                  ])),
                  SliverList.builder(
                    itemCount: provider.recomendations.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.fromLTRB(
                              CustomMethods.mediaWidth(context, 28),
                              0,
                              CustomMethods.mediaWidth(context, 28),
                              CustomMethods.mediaWidth(context, 18)),
                          height: CustomMethods.mediaHeight(context, 5.8),
                          width: double.infinity,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: ColorsClass.bgColor,
                              boxShadow: [
                                BoxShadow(
                                    color: ColorsClass.black.withOpacity(0.1),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5)
                              ],
                              // border: Border.all(
                              //     color: ColorsClass.darkRed.withOpacity(0.3),
                              //     width:
                              //         CustomMethods.mediaWidth(context, 170)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(provider
                                              .listOfPopularMeals[index]
                                              .strMealThumb),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      CustomMethods.mediaWidth(context, 34),
                                      CustomMethods.mediaWidth(context, 32),
                                      CustomMethods.mediaWidth(context, 55),
                                      CustomMethods.mediaWidth(context, 55),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              provider.listOfPopularMeals[index]
                                                  .strMeal,
                                              style: TextStyle(
                                                  color: ColorsClass.black,
                                                  fontSize:
                                                      CustomMethods.mediaWidth(
                                                          context, 18),
                                                  fontFamily: "Fredoka"),
                                            ),
                                            Transform.translate(
                                              offset: Offset(
                                                  0,
                                                  -CustomMethods.mediaWidth(
                                                      context, 78)),
                                              child: Text(
                                                "Japanese",
                                                style: TextStyle(
                                                    color: ColorsClass.black
                                                        .withOpacity(0.5),
                                                    fontSize: CustomMethods
                                                        .mediaWidth(
                                                            context, 20),
                                                    fontFamily: "Fredoka"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Ingredients: 20",
                                              style: TextStyle(
                                                  color: ColorsClass.black
                                                      .withOpacity(0.5),
                                                  fontSize:
                                                      CustomMethods.mediaWidth(
                                                          context, 20),
                                                  fontFamily: "Fredoka"),
                                            ),
                                            Container(
                                              height: CustomMethods.mediaWidth(
                                                  context, 10),
                                              width: CustomMethods.mediaWidth(
                                                  context, 10),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorsClass.darkRed),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: ColorsClass.bgColor,
                                                size: CustomMethods.mediaWidth(
                                                    context, 20),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ))));
  }
}
