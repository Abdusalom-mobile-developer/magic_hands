import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/categories_info.dart';
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
    _bottomNavigationBarIndex = index;
    if (_bottomNavigationBarIndex == 0) {
      context.go("/home");
    } else if (_bottomNavigationBarIndex == 1) {
      context.go("/categories");
    }
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

  List<RecomendationFoodInfo> list = [];

  Future<void> getAllOptions(String category) async {
    list.clear();
    try {
      final response = await get(Uri.parse(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category"));

      List<dynamic> body = [];
      if (response.statusCode == 200) {
        body.addAll(jsonDecode(response.body)["meals"]);

        for (var elem in body) {
          list.add(RecomendationFoodInfo(
              elem["strMeal"], elem["strMealThumb"], elem["idMeal"]));
        }
        notifyListeners();
      }
    } catch (e) {
      LogService.e("$e.");
    }
  }

  Map<String, dynamic> chosenOption = {
    "strMeal": "",
    "strCategory": "",
    "strArea": "",
    "strInstructions": "",
    "strMealThumb":
        "https://i.pinimg.com/474x/6a/f1/ec/6af1ec6645410a41d5339508a83b86f9.jpg",
    "strYoutube": "",
    "listOfIngredients": <Widget>[],
  };

  Future<void> getChosenOptionData(int optionId, BuildContext context) async {
    final response = await get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$optionId"));
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List<Widget> listOfRowMakerIngredients = [];
        List<String> listOfIngredients = [];
        List<String> listOfIngredientsMeasure = [];
        for (int i = 1; i < 9; i++) {
          if (body["meals"][0]["strIngredient$i"] == "" ||
              body["meals"][0]["strIngredient$i"] == null) {
            break;
          } else {
            listOfIngredients.add(body["meals"][0]["strIngredient$i"]);
            listOfIngredientsMeasure.add(body["meals"][0]["strMeasure$i"]);
          }
        }

        // for (int i = 0; i < listOfIngredients.length; i++) {
        //   listOfRowMakerIngredients.add(CustomWidgets.ingredientsRowMaker(
        //       // ignore: use_build_context_synchronously
        //       context,
        //       listOfIngredients[i],
        //       listOfIngredientsMeasure[i]));
        // }

        chosenOption["strMeal"] = body["meals"][0]["strMeal"];
        chosenOption["strCategory"] = body["meals"][0]["strCategory"];
        chosenOption["strArea"] = body["meals"][0]["strArea"];
        chosenOption["strInstructions"] = body["meals"][0]["strInstructions"]
            .toString()
            .replaceAll("\r\n", "");
        chosenOption["strMealThumb"] = body["meals"][0]["strMealThumb"];
        chosenOption["strYoutube"] = body["meals"][0]["strYoutube"];
        chosenOption["listOfIngredients"] = listOfRowMakerIngredients;
        notifyListeners();
      }
    } catch (e) {
      LogService.e(e.toString()+" damn fuck it");
      LogService.e(response.body);
    }
  }
}
