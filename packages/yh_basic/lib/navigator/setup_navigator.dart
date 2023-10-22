import 'package:flutter/cupertino.dart';
import 'package:yh_basic/navigator/app_navigator.dart';

abstract class SetupNavigation {
  SetupNavigation._();

  late AppNavigator appNavigator;

  void createNavigator() {
    appNavigator = AppNavigator();
  }

  void setContext(BuildContext context) {
    appNavigator.setContext(context);
  }
}
