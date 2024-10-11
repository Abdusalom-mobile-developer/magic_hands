import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/moduls/categories_info.dart';
import 'package:magic_hands/moduls/meal_categories.dart';
import 'package:magic_hands/moduls/recomendation_food_info.dart';

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
}
