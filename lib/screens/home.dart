// ignore_for_file: use_build_context_synchronously

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    super.dispose();
    BackButtonInterceptor.remove(myInterceptor);
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    _showExitConfirmation();
    return true;
  }

  void _showExitConfirmation() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: ColorsClass.bgColor,
          title: const Text(
            'Exit Confirmation',
            style: TextStyle(fontFamily: "Fredoka"),
          ),
          content: Text('Do you really want to quit?',
              style: TextStyle(
                  fontFamily: "Fredoka",
                  color: ColorsClass.black.withValues(alpha: 0.6),
                  fontSize: CustomMethods.mediaWidth(context, 23))),
          actions: <Widget>[
            TextButton(
              child: Text(
                'No',
                style: TextStyle(
                  fontFamily: "Fredoka",
                  fontSize: CustomMethods.mediaWidth(context, 25),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  fontFamily: "Fredoka",
                  fontSize: CustomMethods.mediaWidth(context, 25),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProvidersClass>(context).interetConnectionListener();
    return Consumer<ProvidersClass>(
      builder: (context, provider, child) => !provider.isConnected
          ? Scaffold(
              backgroundColor: ColorsClass.bgColor,
              body: SizedBox(
                width: double.infinity,
                child: Transform.translate(
                  offset: Offset(0, -CustomMethods.mediaWidth(context, 11)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        color: ColorsClass.darkRed,
                        size: CustomMethods.mediaWidth(context, 1.7),
                      ),
                      Text(
                        "No Connection !",
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 11),
                            fontFamily: "Fredoka"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Scaffold(
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
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.fastfood_rounded),
                        label: "Categories"),
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
              body: SafeArea(
                  child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: ColorsClass.darkRed.withValues(alpha: 0.3),
                        width: 2),
                  ),
                ),
                width: double.infinity,
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: CustomMethods.mediaWidth(context, 20),
                            vertical: CustomMethods.mediaWidth(context, 17),
                          ),
                          child: Row(
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
                                        color: ColorsClass.black
                                            .withValues(alpha: 0.5),
                                        fontSize: CustomMethods.mediaWidth(
                                            context, 20),
                                        fontFamily: "Fredoka",
                                      ),
                                    ),
                                    Text(
                                      "What would you like to cook today?",
                                      style: TextStyle(
                                        color: ColorsClass.black,
                                        fontSize: CustomMethods.mediaWidth(
                                            context, 14),
                                        fontFamily: "Fredoka",
                                      ),
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
                        ),
                      ),

                      // Top Big Button Part
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: CustomMethods.mediaWidth(context, 20),
                          ),
                          child: Container(
                            height: CustomMethods.mediaHeight(context, 15),
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
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Categories Part
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: CustomMethods.mediaHeight(context, 93),
                            horizontal: CustomMethods.mediaWidth(context, 20),
                          ),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              color: ColorsClass.black,
                              fontSize: CustomMethods.mediaWidth(context, 18),
                              fontFamily: "Fredoka",
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 50),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: CustomMethods.mediaWidth(context, 8),
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: ListView.builder(
                              itemCount: provider.mealCategories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  provider.changeCurrentCategory(
                                    provider.mealCategories[index].strCategory,
                                    provider
                                        .mealCategories[index].strCategoryThumb,
                                  );
                                  provider.makeOptionsClickable();
                                  provider.changeCurrentIndexOfCategory(index);
                                  provider.changeCurrentIndex(2, context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(
                                      CustomMethods.mediaWidth(context, 45)),
                                  margin: index != 0
                                      ? EdgeInsets.only(
                                          right: CustomMethods.mediaWidth(
                                              context, 29),
                                        )
                                      : EdgeInsets.only(
                                          right: CustomMethods.mediaWidth(
                                              context, 29),
                                          left: CustomMethods.mediaWidth(
                                              context, 29),
                                        ),
                                  height: CustomMethods.mediaWidth(context, 8),
                                  width: CustomMethods.mediaWidth(context, 3.4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorsClass.darkRed
                                        .withValues(alpha: 0.16),
                                  ),
                                  child: Text(
                                    provider.mealCategories[index].strCategory,
                                    style: TextStyle(
                                      color: ColorsClass.black,
                                      fontSize:
                                          CustomMethods.mediaWidth(context, 28),
                                      fontFamily: "Fredoka",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 40),
                      ),
                      //Bottom Recomendations Part
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: CustomMethods.mediaWidth(context, 55),
                            horizontal: CustomMethods.mediaWidth(context, 20),
                          ),
                          child: Text(
                            "Recommendations",
                            style: TextStyle(
                              color: ColorsClass.black,
                              fontSize: CustomMethods.mediaWidth(context, 18),
                              fontFamily: "Fredoka",
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 50),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: CustomMethods.mediaHeight(context, 5.3),
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.recomendations.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () async {
                                  provider.listOfRowMakerIngredients.clear();
                                  await provider.getChosenOptionData(
                                    int.parse(
                                        provider.recomendations[index].idMeal),
                                    context,
                                  );
                                  provider.makeListOfIngredients(context);
                                  provider.makeRecipeClickable();
                                  provider.changeCurrentCategory(
                                    provider.listOfRecomendationsImgPaths[index]
                                        ["catName"]!,
                                    provider.listOfRecomendationsImgPaths[index]
                                        ["imgPath"]!,
                                  );
                                  provider.changeCurrentIndex(3, context);
                                },
                                child: Container(
                                  margin: index != 0
                                      ? EdgeInsets.only(
                                          right: CustomMethods.mediaWidth(
                                            context,
                                            18,
                                          ),
                                        )
                                      : EdgeInsets.symmetric(
                                          horizontal: CustomMethods.mediaWidth(
                                              context, 20),
                                        ),
                                  height:
                                      CustomMethods.mediaHeight(context, 5.3),
                                  width: CustomMethods.mediaWidth(context, 2),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        provider
                                            .recomendations[index].strMealThumb,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: ColorsClass.darkRed
                                        .withValues(alpha: 0.16),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          ColorsClass.black
                                              .withValues(alpha: 0.13),
                                          ColorsClass.black
                                              .withValues(alpha: 0.13),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
                                                .withValues(alpha: 0.67),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            provider
                                                .recomendations[index].strMeal,
                                            style: TextStyle(
                                              color: ColorsClass.bgColor,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 24),
                                              fontFamily: "Fredoka",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 25),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: CustomMethods.mediaWidth(context, 20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomWidgets.height(context, 110),
                              Text(
                                "Popular",
                                style: TextStyle(
                                  color: ColorsClass.black,
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 18),
                                  fontFamily: "Fredoka",
                                ),
                              ),
                              CustomWidgets.height(context, 50),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: CustomMethods.mediaHeight(context, 4.5),
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.listOfPopularMeals.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () async {
                                  provider.listOfRowMakerIngredients.clear();
                                  await provider.getChosenOptionData(
                                    int.parse(provider
                                        .listOfPopularMeals[index].idMeal),
                                    context,
                                  );
                                  provider.makeListOfIngredients(context);
                                  provider.changeCurrentCategory(
                                    provider.listOfPopularImgPaths[index]
                                        ["catName"]!,
                                    provider.listOfPopularImgPaths[index]
                                        ["imgPath"]!,
                                  );
                                  provider.changeCurrentIndex(3, context);
                                },
                                child: Container(
                                  margin: index != 0
                                      ? EdgeInsets.only(
                                          right: CustomMethods.mediaWidth(
                                              context, 20),
                                        )
                                      : EdgeInsets.symmetric(
                                          horizontal: CustomMethods.mediaWidth(
                                              context, 20),
                                        ),
                                  height: CustomMethods.mediaHeight(context, 4),
                                  width: CustomMethods.mediaWidth(context, 1.4),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        provider.listOfPopularMeals[index]
                                            .strMealThumb,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          ColorsClass.black
                                              .withValues(alpha: 0.15),
                                          ColorsClass.black
                                              .withValues(alpha: 0.15),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        CustomMethods.mediaWidth(context, 31),
                                      ),
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
                                                .withValues(alpha: 0.67),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                CustomMethods.mediaWidth(
                                                    context, 31),
                                              ),
                                              bottomRight: Radius.circular(
                                                CustomMethods.mediaWidth(
                                                    context, 31),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            provider.listOfPopularMeals[index]
                                                .strMeal,
                                            style: TextStyle(
                                              color: ColorsClass.bgColor,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 24),
                                              fontFamily: "Fredoka",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 21),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: CustomMethods.mediaWidth(context, 20),
                          ),
                          child: Text(
                            "Family Favorites",
                            style: TextStyle(
                              color: ColorsClass.black,
                              fontSize: CustomMethods.mediaWidth(context, 18),
                              fontFamily: "Fredoka",
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 50),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: CustomMethods.mediaHeight(context, 5.3),
                          child: ScrollConfiguration(
                            behavior: NoGlowScrollBehavior(),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  provider.listOfFamilyFavoriteMeals.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () async {
                                  provider.listOfRowMakerIngredients.clear();
                                  await provider.getChosenOptionData(
                                    int.parse(
                                      provider.listOfFamilyFavoriteMeals[index]
                                          .idMeal,
                                    ),
                                    context,
                                  );
                                  provider.makeListOfIngredients(context);
                                  provider.makeRecipeClickable();
                                  provider.changeCurrentCategory(
                                    provider.listOfRecomendationsImgPaths[index]
                                        ["catName"]!,
                                    provider.listOfRecomendationsImgPaths[index]
                                        ["imgPath"]!,
                                  );
                                  provider.changeCurrentIndex(3, context);
                                },
                                child: Container(
                                  margin: index != 0
                                      ? EdgeInsets.only(
                                          right: CustomMethods.mediaWidth(
                                            context,
                                            20,
                                          ),
                                        )
                                      : EdgeInsets.symmetric(
                                          horizontal: CustomMethods.mediaWidth(
                                            context,
                                            20,
                                          ),
                                        ),
                                  height:
                                      CustomMethods.mediaHeight(context, 5.3),
                                  width: CustomMethods.mediaWidth(context, 2),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        provider
                                            .listOfFamilyFavoriteMeals[index]
                                            .strMealThumb,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: ColorsClass.darkRed
                                        .withValues(alpha: 0.16),
                                    borderRadius: BorderRadius.circular(
                                      CustomMethods.mediaWidth(context, 31),
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        colors: [
                                          ColorsClass.black
                                              .withValues(alpha: 0.13),
                                          ColorsClass.black
                                              .withValues(alpha: 0.13),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: CustomMethods.mediaHeight(
                                            context,
                                            20,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: ColorsClass.darkRed
                                                .withValues(alpha: 0.67),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                CustomMethods.mediaWidth(
                                                    context, 31),
                                              ),
                                              bottomRight: Radius.circular(
                                                CustomMethods.mediaWidth(
                                                    context, 31),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            provider
                                                .listOfFamilyFavoriteMeals[
                                                    index]
                                                .strMeal,
                                            style: TextStyle(
                                              color: ColorsClass.bgColor,
                                              fontSize:
                                                  CustomMethods.mediaWidth(
                                                      context, 24),
                                              fontFamily: "Fredoka",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 16),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}

// Disabling the Scroll Effect
class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
