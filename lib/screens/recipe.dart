import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/providers/provider.dart';
import 'package:magic_hands/screens/home.dart';
import 'package:provider/provider.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((stopDefaultButtonEvent, info) =>
        myInterceptor(stopDefaultButtonEvent, info, context));
  }

  bool myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo info, BuildContext context) {
    Provider.of<ProvidersClass>(context, listen: false)
        .changeCurrentIndex(2, context);
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
                body: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: ColorsClass.darkRed.withValues(alpha: 0.3),
                          width: 2),
                    ),
                  ),
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: CustomScrollView(
                      slivers: [
                        SliverList.list(children: [
                          SizedBox(
                              height: CustomMethods.mediaHeight(context, 2.6),
                              width: double.infinity,
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
                            offset: Offset(
                                0, -CustomMethods.mediaWidth(context, 40)),
                            child: Container(
                              height: CustomMethods.mediaWidth(context, 40),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsClass.bgColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        CustomMethods.mediaWidth(context, 31),
                                      ),
                                      topRight: Radius.circular(
                                        CustomMethods.mediaWidth(context, 31),
                                      ))),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            width: double.infinity,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    CustomMethods.mediaWidth(context, 27),
                              ),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: ColorsClass.bgColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Transform.translate(
                                    offset: Offset(
                                      0,
                                      -CustomMethods.mediaHeight(context, 151),
                                    ),
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
                                                    fontSize: CustomMethods
                                                        .mediaWidth(
                                                            context, 14),
                                                    fontFamily: "Fredoka"),
                                              ),
                                              Transform.translate(
                                                offset: Offset(
                                                    0,
                                                    -CustomMethods.mediaWidth(
                                                        context, 70)),
                                                child: Text(
                                                  provider
                                                      .chosenOption["strArea"]
                                                      .toString()
                                                      .trim(),
                                                  style: TextStyle(
                                                      color: ColorsClass.black
                                                          .withValues(
                                                              alpha: 0.5),
                                                      fontSize: CustomMethods
                                                          .mediaWidth(
                                                              context, 20),
                                                      fontFamily: "Fredoka"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(
                                              CustomMethods.mediaWidth(
                                                  context, 130)),
                                          decoration: BoxDecoration(
                                              color: ColorsClass.darkRed
                                                  .withValues(alpha: 0.4),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          height: CustomMethods.mediaHeight(
                                              context, 15),
                                          width: CustomMethods.mediaWidth(
                                              context, 7),
                                          child: Image(
                                            image: NetworkImage(
                                                provider.currentCategoryImg),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Ingredients",
                                    style: TextStyle(
                                        color: ColorsClass.black,
                                        fontSize: CustomMethods.mediaWidth(
                                            context, 18),
                                        fontFamily: "Fredoka"),
                                  ),
                                  CustomWidgets.height(context, 90),
                                  Column(
                                    children:
                                        provider.listOfRowMakerIngredients,
                                  ),
                                  CustomWidgets.height(context, 40),
                                  Text(
                                    "Instruction",
                                    style: TextStyle(
                                        color: ColorsClass.black,
                                        fontSize: CustomMethods.mediaWidth(
                                            context, 18),
                                        fontFamily: "Fredoka"),
                                  ),
                                  CustomWidgets.height(context, 100),
                                  Text(
                                    provider.chosenOption["strInstructions"]
                                        .toString()
                                        .trim(),
                                    style: TextStyle(
                                        color: ColorsClass.black
                                            .withValues(alpha: 0.5),
                                        fontSize: CustomMethods.mediaWidth(
                                            context, 21),
                                        fontFamily: "Fredoka"),
                                  ),
                                  CustomWidgets.height(context, 30),
                                ],
                              ),
                            ),
                          )
                        ])
                      ],
                    ),
                  ),
                )));
  }
}
