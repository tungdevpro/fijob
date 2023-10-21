import 'dart:convert';

enum LoginOption { none, required }

typedef AsyncCallbackFunc = Future<void> Function();
typedef JsonMap = Map<String, dynamic>;

String toJsonMethod(Map<String, dynamic> obj) => jsonEncode(obj);

Map<String, dynamic> fromJsonMethod(String json) => jsonDecode(json) as Map<String, dynamic>;
