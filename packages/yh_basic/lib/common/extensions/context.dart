import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void hideKeyboard() => FocusScope.of(this).requestFocus(FocusNode());

  bool get isTablet {
    var shortestSide = MediaQuery.of(this).size.shortestSide;
    return shortestSide >= 600;
  }

  double get paddingTop => MediaQuery.of(this).padding.top;
}
