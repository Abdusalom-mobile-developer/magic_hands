import 'package:flutter/material.dart';
import 'package:magic_hands/config/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsClass.bgColor,
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [Text("Hello Abdusalom")],
          ),
        )));
  }
}
