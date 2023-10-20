import 'package:flutter/material.dart';

@immutable
abstract class AppDimension {
  const AppDimension._();

  static const double paddingSM = 10.0;
  static const double padding = 12.0;
  static const double paddingLG = 16.0;
  static const double paddingXXL = 24.0;
  static const double maxPadding = 32.0;
  static const double radius = 24.0;
  static const double radiusLG = 32.0;
}
