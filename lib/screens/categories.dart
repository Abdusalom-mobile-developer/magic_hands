import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:magic_hands/screens/home.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((stopDefaultButtonEvent, info) =>
        myInterceptor(stopDefaultButtonEvent, info, context));
  }

  bool myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo info, BuildContext context) {
    Provider.of<ProvidersClass>(context, listen: false)
        .changeCurrentIndex(0, context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
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
                      Icon(Icons.wifi_off_rounded,
                          color: ColorsClass.darkRed,
                          size: CustomMethods.mediaWidth(context, 1.7)),
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
              backgroundColor: ColorsClass.bgColor,
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
              body: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorsClass.darkRed.withValues(alpha: 0.3),
                            width: 2))),
                padding: EdgeInsets.symmetric(
                  horizontal: CustomMethods.mediaWidth(context, 20),
                ),
                width: double.infinity,
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: CustomScrollView(
                    slivers: [
                      // Sliver for the top image
                      SliverToBoxAdapter(
                        child: Image(
                          image: const AssetImage(ImgPath.recipe),
                          height: CustomMethods.mediaWidth(context, 1.5),
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Sliver for the "Categories" header and description
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CustomWidgets.height(context, 1.4),
                            Text(
                              "Categories",
                              style: TextStyle(
                                color: ColorsClass.black,
                                fontSize: CustomMethods.mediaWidth(context, 14),
                                fontFamily: "Fredoka",
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Explore a world of food! Click any type of food to see the options.",
                                    style: TextStyle(
                                      color: ColorsClass.black
                                          .withValues(alpha: 0.5),
                                      fontSize:
                                          CustomMethods.mediaWidth(context, 20),
                                      fontFamily: "Fredoka",
                                    ),
                                  ),
                                ),
                                CustomWidgets.width(context, 10),
                              ],
                            ),
                            CustomWidgets.height(context, 25),
                          ],
                        ),
                      ),
                      // SliverGrid for meal categories
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1 / 1,
                          crossAxisSpacing:
                              CustomMethods.mediaWidth(context, 30),
                          mainAxisSpacing:
                              CustomMethods.mediaWidth(context, 50),
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final category = provider.mealCategories[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (provider.mealCategories[index]
                                                .strCategory ==
                                            "Beef") {
                                          provider
                                              .changeCurrentIndexOfCategory(0);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Chicken") {
                                          provider
                                              .changeCurrentIndexOfCategory(1);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Dessert") {
                                          provider
                                              .changeCurrentIndexOfCategory(2);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Lamb") {
                                          provider
                                              .changeCurrentIndexOfCategory(3);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Miscellaneous") {
                                          provider
                                              .changeCurrentIndexOfCategory(4);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Pasta") {
                                          provider
                                              .changeCurrentIndexOfCategory(5);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Pork") {
                                          provider
                                              .changeCurrentIndexOfCategory(6);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Seafood") {
                                          provider
                                              .changeCurrentIndexOfCategory(7);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Side") {
                                          provider
                                              .changeCurrentIndexOfCategory(8);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Starter") {
                                          provider
                                              .changeCurrentIndexOfCategory(9);
                                        } else if (provider
                                                .mealCategories[index]
                                                .strCategory ==
                                            "Vegan") {
                                          provider
                                              .changeCurrentIndexOfCategory(10);
                                        } else {
                                          provider
                                              .changeCurrentIndexOfCategory(11);
                                        }
                                        // provider.getAllOptions(provider
                                        //     .mealCategories[index].strCategory);

                                        provider.changeCurrentCategory(
                                            provider.mealCategories[index]
                                                .strCategory,
                                            provider.mealCategories[index]
                                                .strCategoryThumb);
                                        provider.makeOptionsClickable();
                                        provider.changeCurrentIndex(2, context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorsClass.darkRed
                                            .withValues(alpha: 0.18),
                                      ),
                                      child: FadeInImage(
                                        placeholderFit: BoxFit.scaleDown,
                                        placeholder: const AssetImage(
                                            ImgPath.placeholder2),
                                        image: NetworkImage(
                                            category.strCategoryThumb),
                                        fit: BoxFit.cover,
                                        fadeInDuration:
                                            const Duration(milliseconds: 200),
                                        fadeInCurve: Curves.easeInCirc,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  category.strCategory,
                                  style: TextStyle(
                                    color: ColorsClass.black,
                                    fontSize:
                                        CustomMethods.mediaWidth(context, 20),
                                    fontFamily: "Fredoka",
                                  ),
                                ),
                                CustomWidgets.height(context, 70),
                              ],
                            );
                          },
                          childCount: provider.mealCategories.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomWidgets.height(context, 27),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
