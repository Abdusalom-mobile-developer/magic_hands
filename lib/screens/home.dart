import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/hive_keys.dart';
import 'package:magic_hands/services/hive_crud.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsClass.bgColor,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: CustomMethods.mediaWidth(context, 20)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWidgets.height(context, 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
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
                  Container(
                    width: CustomMethods.mediaWidth(context, 6.5),
                    height: CustomMethods.mediaWidth(context, 6.5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(ImgPath.spaghetti),
                            fit: BoxFit.cover)),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
