import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/categories_info.dart';
import 'package:magic_hands/moduls/food_info.dart';
import 'package:magic_hands/moduls/meal_categories.dart';
import 'package:magic_hands/moduls/popular_meals.dart';
import 'package:magic_hands/moduls/recomendation_food_info.dart';
import 'package:magic_hands/services/log.dart';

class ProvidersClass extends ChangeNotifier {
  bool _hadError = false;
  int _bottomNavigationBarIndex = 0;

  bool get hadError => _hadError;
  int get bottomNavigationBarIndex => _bottomNavigationBarIndex;

  void madeError() {
    _hadError = true;
    notifyListeners();
  }

  void fixedError() {
    _hadError = false;
    notifyListeners();
  }

  void changeCurrentIndex(int index, BuildContext context) {
    List<String> routes = ["/home", "/categories", "/meal_options", "/recipe"];
    if (index == 2 && !_optionsClickable) {
      _bottomNavigationBarIndex = _bottomNavigationBarIndex;
    } else if (index == 3 && !_recipeClickable) {
      _bottomNavigationBarIndex = _bottomNavigationBarIndex;
    } else {
      _bottomNavigationBarIndex = index;
    }

    // if(index == 1){
    //   clearList();
    // }
    context.go(routes[_bottomNavigationBarIndex]);
    notifyListeners();
  }

  List<CategoriesInfo> categoriesInfo = [
    CategoriesInfo("British", "assets/images/flags/ic_britain.jpg"),
    CategoriesInfo("American", "assets/images/flags/ic_america.jpg"),
    CategoriesInfo("French", "assets/images/flags/ic_france.jpg"),
    CategoriesInfo("Canadian", "assets/images/flags/ic_canada.jpg"),
    CategoriesInfo("Jamaican", "assets/images/flags/ic_jamaica.jpg"),
    CategoriesInfo("Chinese", "assets/images/flags/ic_china.jpg"),
    CategoriesInfo("Dutch", "assets/images/flags/ic_netherlands.jpg"),
    CategoriesInfo("Egyptian", "assets/images/flags/ic_egypt.jpg"),
    CategoriesInfo("Greek", "assets/images/flags/ic_greece.jpg"),
    CategoriesInfo("Indian", "assets/images/flags/ic_india.jpg"),
    CategoriesInfo("Irish", "assets/images/flags/ic_ireland.jpg"),
    CategoriesInfo("Italian", "assets/images/flags/ic_italy.jpg"),
    CategoriesInfo("Japanese", "assets/images/flags/ic_japan.jpg"),
    CategoriesInfo("Malaysian", "assets/images/flags/ic_malaysia.jpg"),
    CategoriesInfo("Mexican", "assets/images/flags/ic_mexico.jpg"),
    CategoriesInfo("Moroccan", "assets/images/flags/ic_morocco.jpg"),
    CategoriesInfo("Croatian", "assets/images/flags/ic_croatia.jpg"),
    CategoriesInfo("Portuguese", "assets/images/flags/ic_portugal.jpg"),
    CategoriesInfo("Russian", "assets/images/flags/ic_russia.jpg"),
    CategoriesInfo("Spanish", "assets/images/flags/ic_spain.jpg"),
    CategoriesInfo("Thai", "assets/images/flags/ic_thailand.jpg"),
    CategoriesInfo("Tunisian", "assets/images/flags/ic_tunisia.jpg"),
    CategoriesInfo("Polish", "assets/images/flags/ic_poland.jpg"),
    CategoriesInfo("Filipino", "assets/images/flags/ic_philippines.jpg"),
  ];

  List<MealCategories> mealCategories = [
    MealCategories(
        "1", "Beef", "https://www.themealdb.com/images/category/beef.png"),
    MealCategories("2", "Chicken",
        "https://www.themealdb.com/images/category/chicken.png"),
    MealCategories("3", "Dessert",
        "https://www.themealdb.com/images/category/dessert.png"),
    MealCategories(
        "4", "Lamb", "https://www.themealdb.com/images/category/lamb.png"),
    MealCategories("5", "Miscellaneous",
        "https://www.themealdb.com/images/category/miscellaneous.png"),
    MealCategories(
        "6", "Pasta", "https://www.themealdb.com/images/category/pasta.png"),
    MealCategories(
        "7", "Pork", "https://www.themealdb.com/images/category/pork.png"),
    MealCategories("8", "Seafood",
        "https://www.themealdb.com/images/category/seafood.png"),
    MealCategories(
        "9", "Side", "https://www.themealdb.com/images/category/side.png"),
    MealCategories("10", "Starter",
        "https://www.themealdb.com/images/category/starter.png"),
    MealCategories(
        "11", "Vegan", "https://www.themealdb.com/images/category/vegan.png"),
    MealCategories("12", "Vegetarian",
        "https://www.themealdb.com/images/category/vegetarian.png"),
  ];

  List<RecomendationFoodInfo> recomendations = [
    RecomendationFoodInfo(
        "French Omelette",
        "https://www.themealdb.com/images/media/meals/yvpuuy1511797244.jpg",
        "52915"),
    RecomendationFoodInfo(
        "Lasagne",
        "https://www.themealdb.com/images/media/meals/wtsvxx1511296896.jpg",
        "52844"),
    RecomendationFoodInfo(
        "Burek",
        "https://www.themealdb.com/images/media/meals/tkxquw1628771028.jpg",
        "53051"),
    RecomendationFoodInfo(
        "Nasi lemak",
        "https://www.themealdb.com/images/media/meals/wai9bw1619788844.jpg",
        "53051"),
    RecomendationFoodInfo(
        "Chicken Basquaise",
        "https://www.themealdb.com/images/media/meals/wruvqv1511880994.jpg",
        "52934"),
    RecomendationFoodInfo(
        "Blackberry Fool",
        "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg",
        "52891"),
    RecomendationFoodInfo(
        "Clam chowder",
        "https://www.themealdb.com/images/media/meals/rvtvuw1511190488.jpg",
        "52840"),
    RecomendationFoodInfo(
        "Vegan Lasagna",
        "https://www.themealdb.com/images/media/meals/rvxxuy1468312893.jpg",
        "52775"),
    RecomendationFoodInfo(
        "Flamiche",
        "https://www.themealdb.com/images/media/meals/wssvvs1511785879.jpg",
        "52906"),
    RecomendationFoodInfo(
        "Japanese Katsudon",
        "https://www.themealdb.com/images/media/meals/d8f6qx1604182128.jpg",
        "53034")
  ];

  List<PopularMeals> listOfPopularMeals = [
    PopularMeals("Ma Po Tofu",
        "https://www.themealdb.com/images/media/meals/1525874812.jpg", "52947"),
    PopularMeals(
        "Tandoori chicken",
        "https://www.themealdb.com/images/media/meals/qptpvt1487339892.jpg",
        "52806"),
    PopularMeals(
        "Christmas cake",
        "https://www.themealdb.com/images/media/meals/ldnrm91576791881.jpg",
        "52990"),
    PopularMeals(
        "Tunisian Lamb Soup",
        "https://www.themealdb.com/images/media/meals/t8mn9g1560460231.jpg",
        "52972"),
    PopularMeals(
        "Turkey Meatloaf",
        "https://www.themealdb.com/images/media/meals/ypuxtw1511297463.jpg",
        "52845"),
    PopularMeals(
        "Pilchard puttanesca",
        "https://www.themealdb.com/images/media/meals/vvtvtr1511180578.jpg",
        "52837"),
    PopularMeals(
        "Bigos (Hunters Stew)",
        "https://www.themealdb.com/images/media/meals/md8w601593348504.jpg",
        "53018"),
    PopularMeals(
        "Tuna and Egg Briks",
        "https://www.themealdb.com/images/media/meals/2dsltq1560461468.jpg",
        "52975"),
    PopularMeals(
        "Split Pea Soup",
        "https://www.themealdb.com/images/media/meals/xxtsvx1511814083.jpg",
        "52925"),
    PopularMeals(
        "Creamy Tomato Soup",
        "https://www.themealdb.com/images/media/meals/stpuws1511191310.jpg",
        "52841"),
  ];

  Future<String> getArea(int optionId) async {
    final response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$optionId"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body["meals"][0]["strArea"];
    }

    return "Unknown";
  }

  Future<int> getNumOfIngre(int optionId) async {
    final response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$optionId"));

    int count = 0;
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      for (int i = 1; i < 21; i++) {
        if (body["meals"][0]["strIngredient$i"] == "" ||
            body["meals"][0]["strIngredient$i"] == null) {
          break;
        } else {
          count++;
        }
      }
    }

    return count;
  }

  List<FoodInfo> list = [];

  String _currentCategory = "Chicken";
  String _currentCategoryImg =
      "https://www.themealdb.com/images/category/chicken.png";
  String get currentCategory => _currentCategory;
  String get currentCategoryImg => _currentCategoryImg;

  void changeCurrentCategory(String value, String imgPath) {
    _currentCategory = value;
    _currentCategoryImg = imgPath;
    notifyListeners();
  }

  Future<void> getAllOptions(String category) async {
    list.clear();
    try {
      final response = await get(Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));

      List<dynamic> body = [];
      if (response.statusCode == 200) {
        body.addAll(jsonDecode(response.body)["meals"]);

        for (var elem in body) {
          list.add(FoodInfo(
              elem["strMeal"],
              elem["strMealThumb"],
              elem["idMeal"],
              await getArea(int.parse(elem["idMeal"])),
              await getNumOfIngre(int.parse(elem["idMeal"]))));
          notifyListeners();
        }
        // notifyListeners();
      }
    } catch (e) {
      LogService.e("$e.");
    }
  }

  bool _optionsClickable = false;
  bool get optionClickable => _optionsClickable;
  // ignore: unused_field
  bool _recipeClickable = false;
  bool get recipeClickable => _optionsClickable;

  void makeOptionsClickable() {
    _optionsClickable = true;
    notifyListeners();
  }

  void makeRecipeClickable(){
    _recipeClickable = true;
    notifyListeners();
  }

  // ignore: prefer_final_fields
  List<String> _listOfIngredients = [];
  // ignore: prefer_final_fields
  List<String> _listOfIngredientsMeasure = [];
  List<Widget> listOfRowMakerIngredients = [];

  void makeListOfIngredients(BuildContext context) {
    try {
      for (int i = 0; i < _listOfIngredients.length; i++) {
        listOfRowMakerIngredients.add(CustomWidgets.ingredientsRowMaker(
            context, _listOfIngredients[i], _listOfIngredientsMeasure[i]));
      }
      notifyListeners();
      LogService.d(listOfRowMakerIngredients.toString());
    } catch (e) {
      LogService.w(e.toString());
    }
  }

  Map<String, dynamic> chosenOption = {
    "strMeal": "Turkey Meatloaf",
    "strCategory": "Miscellaneous",
    "strArea": "Turkey",
    "strInstructions":
        "Heat oven to 180C/160C fan/gas 4. Heat the oil in a large frying pan and cook the onion for 8-10 mins until softened. Add the garlic, Worcestershire sauce and 2 tsp tomato purée, and stir until combined. Set aside to cool.\r\n\r\nPut the turkey mince, egg, breadcrumbs and cooled onion mix in a large bowl and season well. Mix everything to combine, then shape into a rectangular loaf and place in a large roasting tin. Spread 2 tbsp barbecue sauce over the meatloaf and bake for 30 mins.\r\n\r\nMeanwhile, drain 1 can of beans only, then pour both cans into a large bowl. Add the remaining barbecue sauce and tomato purée. Season and set aside.\r\n\r\nWhen the meatloaf has had its initial cooking time, scatter the beans around the outside and bake for 15 mins more until the meatloaf is cooked through and the beans are piping hot. Scatter over the parsley and serve the meatloaf in slices."
            .replaceAll("\r\n", ""),
    "strMealThumb":
        "https://www.themealdb.com/images/media/meals/ypuxtw1511297463.jpg",
    "strYoutube": "https://www.youtube.com/watch?v=mTvlmY4vCug",
  };

  void clearList(){
    list.clear();
    notifyListeners();
  }

  Future<void> getChosenOptionData(int optionId, BuildContext context) async {
    final response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$optionId"));
    _listOfIngredients.clear();
    _listOfIngredientsMeasure.clear();
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        for (int i = 1; i < 21; i++) {
          if (body["meals"][0]["strIngredient$i"] == "" ||
              body["meals"][0]["strIngredient$i"] == null) {
            break;
          } else {
            List<String> textList =
                body["meals"][0]["strIngredient$i"].toString().split(" ");
            if (textList.length > 2) {
              textList.removeRange(2, textList.length);
              if (textList.join().length > 10) {
                textList.removeLast();
                _listOfIngredients.add(textList.join(" "));
              }
              _listOfIngredients.add(textList.join(" "));
            } else {
              _listOfIngredients.add(textList.join(" "));
            }

            List<String> measureList =
                body["meals"][0]["strMeasure$i"].toString().split(" ");
            if (measureList.length > 2) {
              measureList.removeRange(2, measureList.length);
              if (measureList.join().length > 10) {
                measureList.removeLast();
                _listOfIngredientsMeasure.add(measureList.join(" "));
              }
              _listOfIngredientsMeasure.add(measureList.join(" "));
            } else {
              _listOfIngredientsMeasure.add(measureList.join(" "));
            }
          }
        }

        chosenOption["strMeal"] = body["meals"][0]["strMeal"];
        chosenOption["strCategory"] = body["meals"][0]["strCategory"];
        chosenOption["strArea"] = body["meals"][0]["strArea"];
        chosenOption["strInstructions"] = body["meals"][0]["strInstructions"]
            .toString()
            .replaceAll("\r\n", "");
        chosenOption["strMealThumb"] = body["meals"][0]["strMealThumb"];
        chosenOption["strYoutube"] = body["meals"][0]["strYoutube"];

        notifyListeners();
      }
    } catch (e) {
      LogService.e(e.toString());
      LogService.e(response.body);
    }
  }
}
