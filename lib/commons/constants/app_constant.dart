import 'package:flutter/material.dart';

@immutable
abstract class AppConstants {
  const AppConstants._();

  static const String title = "FiJob";
  static const String id = "iw90456";
  static const String domain = "http://localhost:3001/api";
  static const Locale startLocale = Locale("vi", "VN");
  static const Iterable<Locale> supportedLocales = [Locale("vi", "VN"), Locale('en', 'US')];
}
