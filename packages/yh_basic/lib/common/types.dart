import 'dart:convert';

import 'package:flutter/cupertino.dart';

enum LoginOption { none, required }

typedef AsyncCallbackFunc = Future<void> Function();
typedef JsonMap = Map<String, dynamic>;

String toJsonMethod(Map<String, dynamic> obj) => jsonEncode(obj);

Map<String, dynamic> fromJsonMethod(String json) => jsonDecode(json) as Map<String, dynamic>;

abstract class Arguments<T> {
  final T? data;

  Arguments([this.data]);
}

typedef InitialBuilder = Widget Function(BuildContext context);
typedef LoadingBuilder<T> = Widget Function(BuildContext context, T? data);
typedef SuccessBuilder<T> = Widget Function(BuildContext context, T data);
typedef EmptyBuilder = Widget Function(BuildContext context);
typedef ErrorBuilder = Widget Function(BuildContext context, Object error);
typedef RefreshingBuilder<T> = Widget Function(BuildContext context, T? data);
