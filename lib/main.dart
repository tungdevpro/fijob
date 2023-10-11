import 'package:fijob/commons/constants/app_constant.dart';
import 'package:fijob/core/navigator/routes.dart';
import 'package:fijob/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yh_basic/types.dart';
import 'package:yh_basic/yh_basic.dart';

void main() {
  init(
      site: const Site(id: AppConsants.id, title: AppConsants.title, domain: AppConsants.domain),
      routerConfig: Routes.router,
      startLocale: AppConsants.startLocale,
      loginOption: LoginOption.required,
      useCaching: true,
      asyncCallbacks: [],
      callbacks: [
        () => SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light)),
        () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
        () => configureDependencies(),
      ]);
}
