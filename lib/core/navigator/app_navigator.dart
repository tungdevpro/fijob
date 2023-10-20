import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppNavigator {
  BuildContext? _context;

  BuildContext get context => _context!;

  void setContext(BuildContext ctx) {
    _context = ctx;
  }

  Future<dynamic> push(dynamic page, {dynamic arguments}) async {
    if (_context == null) return;
    return await Navigator.push(
      _context!,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => page,
      ),
    );
  }

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) async {
    if (_context == null) return;
    return await Navigator.pushNamed(_context!, routeName,
        arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic arguments, dynamic result}) async {
    if (_context == null) return;
    return await Navigator.pushReplacementNamed(_context!, routeName,
        arguments: arguments, result: result);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {dynamic arguments}) async {
    if (_context == null) return;
    return await Navigator.pushNamedAndRemoveUntil(
      _context!,
      routeName,
          (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop({dynamic result}) async {
    if (_context == null) return;
    Navigator.of(_context!).pop();
  }
}