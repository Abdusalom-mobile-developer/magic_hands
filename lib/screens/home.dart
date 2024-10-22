import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/hive_keys.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:magic_hands/services/hive_crud.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood_rounded), label: "Categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ]),
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsClass.bgColor,
          body: SafeArea(
              child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ColorsClass.darkRed.withOpacity(0.3),
                        width: 2))),
            padding: EdgeInsets.symmetric(
                horizontal: CustomMethods.mediaWidth(context, 20)),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomWidgets.height(context, 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Part
                    Expanded(
                      // Top Left Texts Part
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, ${HiveCrud.read(HiveKeys.username) ?? "unknown"}",
                            style: TextStyle(
                                color: ColorsClass.black.withOpacity(0.5),
                                fontSize: CustomMethods.mediaWidth(context, 20),
                                fontFamily: "Fredoka"),
                          ),
                          Text(
                            "What would you like to cook today?",
                            style: TextStyle(
                                color: ColorsClass.black,
                                fontSize: CustomMethods.mediaWidth(context, 14),
                                fontFamily: "Fredoka"),
                          ),
                        ],
                      ),
                    ),
                    // Top Right Image Part
                    Image(
                      image: const AssetImage(ImgPath.ramen),
                      width: CustomMethods.mediaWidth(context, 4),
                    ),
                  ],
                ),
                CustomWidgets.height(context, 16),
                // Top Big Button Part
                Container(
                    height: CustomMethods.mediaWidth(context, 6.8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsClass.darkRed,
                    ),
                    child: TextButton(
                      onPressed: () {
                        provider.changeCurrentIndex(1, context);
                        context.go("/categories");
                      },
                      child: Text(
                        "See all categories",
                        style: TextStyle(
                            color: ColorsClass.bgColor,
                            fontFamily: "Fredoka",
                            fontSize: CustomMethods.mediaWidth(context, 22)),
                      ),
                    )),
                CustomWidgets.height(context, 20),
                // Categories Part
                Text(
                  "Categories",
                  style: TextStyle(
                      color: ColorsClass.black,
                      fontSize: CustomMethods.mediaWidth(context, 18),
                      fontFamily: "Fredoka"),
                ),
                CustomWidgets.height(context, 50),
                SizedBox(
                  height: CustomMethods.mediaWidth(context, 8),
                  child: ListView.builder(
                    itemCount: provider.mealCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        provider.getAllOptions(provider
                                      .mealCategories[index].strCategory);
                        context.go("/meal_options");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(7),
                        margin: index != provider.mealCategories.length - 1
                            ? const EdgeInsets.only(right: 12)
                            : const EdgeInsets.only(right: 0),
                        height: CustomMethods.mediaWidth(context, 8),
                        width: CustomMethods.mediaWidth(context, 3.4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsClass.darkRed.withOpacity(0.16),
                        ),
                        child: Text(
                          provider.mealCategories[index].strCategory,
                          style: TextStyle(
                              color: ColorsClass.black,
                              fontSize: CustomMethods.mediaWidth(context, 28),
                              fontFamily: "Fredoka"),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomWidgets.height(context, 25),
                //Bottom Recomendations Part
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recomendations",
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 18),
                            fontFamily: "Fredoka"),
                      ),
                      CustomWidgets.height(context, 50),
                      SizedBox(
                        height: CustomMethods.mediaHeight(context, 5.3),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.recomendations.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.push("/recipe");
                            },
                            child: Container(
                                margin:
                                    index != provider.recomendations.length - 1
                                        ? const EdgeInsets.only(right: 18)
                                        : const EdgeInsets.only(right: 0),
                                height: CustomMethods.mediaHeight(context, 5.3),
                                width: CustomMethods.mediaWidth(context, 2),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(provider
                                          .recomendations[index].strMealThumb),
                                      fit: BoxFit.cover,
                                    ),
                                    color:
                                        ColorsClass.darkRed.withOpacity(0.16),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          colors: [
                                            ColorsClass.black.withOpacity(0.13),
                                            ColorsClass.black.withOpacity(0.13)
                                          ]),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: CustomMethods.mediaHeight(
                                            context, 20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: ColorsClass.darkRed
                                                .withOpacity(0.67),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        child: Text(
                                          provider
                                              .recomendations[index].strMeal,
                                          style: TextStyle(
                                              color: ColorsClass.bgColor,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 24),
                                              fontFamily: "Fredoka"),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      CustomWidgets.height(context, 25),
                      Text(
                        "Popular",
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 18),
                            fontFamily: "Fredoka"),
                      ),
                      CustomWidgets.height(context, 50),
                      SizedBox(
                        height: CustomMethods.mediaHeight(context, 4),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.listOfPopularMeals.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              context.push("/recipe");
                            },
                            child: Container(
                                margin: index !=
                                        provider.listOfPopularMeals.length - 1
                                    ? const EdgeInsets.only(right: 22)
                                    : const EdgeInsets.only(right: 0),
                                height: CustomMethods.mediaHeight(context, 4),
                                width: CustomMethods.mediaWidth(context, 1.4),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(provider
                                          .listOfPopularMeals[index]
                                          .strMealThumb),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          ColorsClass.black.withOpacity(0.15),
                                          ColorsClass.black.withOpacity(0.15)
                                        ]),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: CustomMethods.mediaHeight(
                                            context, 20),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: ColorsClass.darkRed
                                                .withOpacity(0.67),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        child: Text(
                                          provider.listOfPopularMeals[index]
                                              .strMeal,
                                          style: TextStyle(
                                              color: ColorsClass.bgColor,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 24),
                                              fontFamily: "Fredoka"),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      CustomWidgets.height(context, 18),
                    ],
                  ),
                ))
              ],
            ),
          ))),
    );
  }
}
