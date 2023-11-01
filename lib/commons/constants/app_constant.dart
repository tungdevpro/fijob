import 'package:flutter/material.dart';

@immutable
abstract class AppConstants {
  const AppConstants._();

  static const String title = "FiJob";
  static const String id = "iw90456";
  static const String domain = "https://jsonplaceholder.typicode.com/";
  static const Locale startLocale = Locale("vi", "VN");
  static const Iterable<Locale> supportedLocales = [startLocale, Locale('en', 'US')];
}
