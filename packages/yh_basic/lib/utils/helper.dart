import 'package:flutter/material.dart';
import 'package:yh_basic/core/base_function.dart';

@immutable
abstract class Helper {
  const Helper._();

  static bool inArray(dynamic value, var array) {
    if (!empty(value) && !empty(array)) {
      if (array is List || array is Map) {
        if (array is Map) return array.containsValue(value);
        if (array is List) return array.contains(value);
      }
      return false;
    }
    return false;
  }
}
