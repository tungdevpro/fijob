import 'package:flutter/cupertino.dart';

@immutable
abstract class ApiPath {
  const ApiPath._();

  static const String listPost = '/posts';
}

abstract class MockPath {
  const MockPath._();

  static const String listCountry = '/countries';
}
