import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';
import 'package:magic_hands/config/methods.dart';
import 'package:magic_hands/config/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = "/onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.bgColor,
      body: PageView(
        reverse: false,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: CustomMethods.mediaWidth(context, 7)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: CustomWidgets.rowOfLines(context, _currentIndex),
              ),
            ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: CustomMethods.mediaWidth(context, 7)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: CustomWidgets.rowOfLines(context, _currentIndex),
              ),
            ]),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: CustomMethods.mediaWidth(context, 7)),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: CustomWidgets.rowOfLines(context, _currentIndex),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
