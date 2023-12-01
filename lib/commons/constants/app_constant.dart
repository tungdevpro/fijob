import 'package:flutter/material.dart';

@immutable
abstract class AppConstants {
  const AppConstants._();

  static const String title = "FiJob";
  static const String id = "iw90456";
  static const String domain = "https://jsonplaceholder.typicode.com/";
  static const Locale startLocale = Locale("en");
  static const Iterable<Locale> supportedLocales = [startLocale, Locale('vi')];
  static const int page = 0;
  static const int limit = 10;
  static const String translatePath = 'assets/translations';
  static const String defaultBox = "config";

  // API 3rd
  static const String placeholderApi = "https://jsonplaceholder.typicode.com/";
  static const String mockApi = "https://6565fc96eb8bb4b70ef2bc0b.mockapi.io/api/v1/";
}
