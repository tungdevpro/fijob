import 'package:flutter/material.dart';

@immutable
abstract class RoutePath {
  const RoutePath._();

  static const String initial = "/";
  static const String gettingStarted = "/getting-started";
  static const String home = "/home";
  static const String auth = "/auth";
  static const String login = "$auth/login";
  static const String register = "$auth/register";
}
