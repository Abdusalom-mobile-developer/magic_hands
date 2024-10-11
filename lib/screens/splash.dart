// ignore_for_file: unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';
import 'package:magic_hands/moduls/hive_keys.dart';
import 'package:magic_hands/services/hive_crud.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/splash_screen";
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2100),
      () {
        bool? check = HiveCrud.read(HiveKeys.isFirst);
        if (check == false) {
          context.go("/home");
        } else {
          context.go("/onboarding");
        }
        // context.go("/onboarding");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsClass.bgColor,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage(ImgPath.logo),
                    height: CustomMethods.mediaWidth(context, 1.4),
                  ),
                  Text("Magic Hands",
                      style: TextStyle(
                          color: ColorsClass.black,
                          fontSize: CustomMethods.mediaWidth(context, 9),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Fredoka")),
                  CustomWidgets.height(context, 5),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: CustomMethods.mediaWidth(context, 24)),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Create your own magic.",
                        style: TextStyle(
                            color: ColorsClass.black,
                            fontSize: CustomMethods.mediaWidth(context, 18),
                            fontFamily: "Fredoka"))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
