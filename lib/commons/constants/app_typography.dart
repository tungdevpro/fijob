import 'package:flutter/material.dart';

@immutable
abstract class AppTypography {
  const AppTypography._();

  static const double extraSmallFs = 10.0;
  static const double smallFs = 12.0;
  static const double mediumFs = 14.0;
  static const double largeFs = 16.0;
  static const double extraLargeFs = 18.0;
  static const double maxLargeFs = 24.0;
  static const String fontFamily = 'PlusJakartaSans';
}
