import 'package:flutter/material.dart';

@immutable
abstract class AppConstants {
  const AppConstants._();

  static const String title = "FiJob";
  static const String id = "iw90456";
  static const String domain = "http://192.168.0.3:3002/v1";
  static const Locale startLocale = Locale("vi", "VN");
  static const Iterable<Locale> supportedLocales = [startLocale, Locale('en', 'US')];
}
