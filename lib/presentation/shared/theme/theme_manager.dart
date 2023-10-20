import 'package:fijob/commons/constants/app_typography.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ThemeManager {
  const ThemeManager._();

  static ThemeMode mode = ThemeMode.light;

  static ThemeData get light => ThemeData(
    fontFamily: AppTypography.fontFamily,
    scaffoldBackgroundColor: Colors.white,
  );
}