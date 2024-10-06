import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/methods.dart';

class CustomWidgets {
  // Method that return SizedBox(height)
  static Widget height(BuildContext context, double value) {
    return SizedBox(
      height: CustomMethods.mediaWidth(context, value),
    );
  }

  // Method that return SizedBox(width)
  static Widget width(BuildContext context, double value) {
    return SizedBox(
      width: CustomMethods.mediaWidth(context, value),
    );
  }

  static List<Widget> rowOfLines(BuildContext context, int index) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(Container(
        height: CustomMethods.mediaWidth(context, 60),
        width: index == i
            ? CustomMethods.mediaWidth(context, 8)
            : CustomMethods.mediaWidth(context, 50),
        decoration: BoxDecoration(
            color: index == i
                ? ColorsClass.darkRed
                : ColorsClass.darkRed.withOpacity(0.55),
            borderRadius: BorderRadius.circular(10)),
      ));
      if (i != 2) {
        list.add(CustomWidgets.width(context, 100));
      }
    }
    return list;
  }

  static Widget pageViewPages(
      BuildContext context, String imagePath, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: CustomMethods.mediaWidth(context, 10)),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(imagePath),
                      width: CustomMethods.mediaWidth(context, 1.3),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidgets.height(context, 20),
                  Text(
                    "If you want to:",
                    style: TextStyle(
                        fontFamily: "Fredoka",
                        color: ColorsClass.darkRed,
                        fontSize: CustomMethods.mediaWidth(context, 20)),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: ColorsClass.black,
                        fontFamily: "Fredoka",
                        fontSize: CustomMethods.mediaWidth(context, 15)),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
