import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';

mixin LogMixin on Object {
  void log(Object? msg) {
    dev.log(msg.toString());
  }

  dLog(String? msg) {
    debugPrint(msg);
  }
}