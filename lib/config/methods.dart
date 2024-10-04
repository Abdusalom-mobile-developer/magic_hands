import 'package:flutter/material.dart';

class CustomMethods{
  // Method to use instead of MediaQuery.of(context).size.width
  static double mediaWidth(BuildContext context, value){
    return MediaQuery.of(context).size.width / value;
  }

  // Method to use instead of MediaQuery.of(context).size.height
  static double mediaHeight(BuildContext context, value){
    return MediaQuery.of(context).size.height / value;
  }
}