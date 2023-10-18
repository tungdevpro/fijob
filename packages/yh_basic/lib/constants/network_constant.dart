import 'package:flutter/material.dart';

@immutable
abstract class NetworkConstants {
  const NetworkConstants._();

  static const String contentType = 'application/json';
  static const String success = "Success";
}

@immutable
abstract class DioConstants {
  const DioConstants._();

  static const Duration timeout = Duration(milliseconds: 1000 * 20);
}
