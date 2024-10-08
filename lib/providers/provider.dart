import 'package:flutter/material.dart';

class ProvidersClass extends ChangeNotifier {
  bool _hadError = false;

  bool get hadError => _hadError;

  void madeError() {
    _hadError = true;
    notifyListeners();
  }

  void fixedError() {
    _hadError = false;
    notifyListeners();
  }
}
