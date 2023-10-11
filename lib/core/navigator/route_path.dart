import 'package:flutter/material.dart';

@immutable
abstract class RoutePath {
  const RoutePath._();

  static const String initial = "/";
  static const String gettingStarted = "/getting-started";
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
}
