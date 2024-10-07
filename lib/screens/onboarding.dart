import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/img_path.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsClass.bgColor,
      body: Stack(
        children: [
          PageView(
            reverse: false,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            children: [
              CustomWidgets.pageViewPages(context, ImgPath.enjoyingGirl,
                  "Gain cooking confidence and enjoy every bite of your creation!"),
              CustomWidgets.pageViewPages(context, ImgPath.happyGirl,
                  "Master your cooking skills and enjoy with total satisfaction."),
              CustomWidgets.pageViewPages(context, ImgPath.thinkingGirl,
                  "Master cooking styles from every corner of the world from home."),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
                horizontal: CustomMethods.mediaWidth(context, 10)),
            padding:
                EdgeInsets.only(bottom: CustomMethods.mediaWidth(context, 9.9)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: CustomWidgets.rowOfLines(context, _currentIndex),
                  ),
                  _currentIndex < 2
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: CustomMethods.mediaWidth(context, 40)),
                          child: GestureDetector(
                            onTap: () {
                              context.go("/register");
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: ColorsClass.black,
                                  fontFamily: "Fredoka",
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 17)),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            context.go("/register");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    CustomMethods.mediaWidth(context, 30),
                                vertical:
                                    CustomMethods.mediaWidth(context, 40)),
                            decoration: BoxDecoration(
                                color: ColorsClass.darkRed,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: ColorsClass.bgColor,
                                  fontFamily: "Fredoka",
                                  fontSize:
                                      CustomMethods.mediaWidth(context, 17)),
                            ),
                          ),
                        )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
