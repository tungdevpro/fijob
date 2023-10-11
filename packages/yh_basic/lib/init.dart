import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:yh_basic/application.dart';
import 'package:yh_basic/types.dart';
import 'package:yh_basic/yh_basic.dart';

void init({
  required Site site,
  Widget? child,
  List<String> boxs = const [],
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
  Locale? startLocale,
  List<AsyncCallbackFunc>? asyncCallbacks,
  List<AsyncCallbackFunc>? callInMyApps,
  List<VoidCallback>? callbacks,
  LoginOption loginOption = LoginOption.none,
  bool useCaching = false,
  required RouterConfig<Object> routerConfig,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  AppGlobal.I(siteParam: site);

  if (callbacks != null) {
    for (var func in callbacks) {
      func.call();
    }
  }

  if (asyncCallbacks != null) {
    await Future.forEach(asyncCallbacks, (AsyncCallbackFunc? cb) async {
      await cb?.call();
    });
  }

  runApp(Application(
    routerConfig: routerConfig,
    startLocale: startLocale,
    supportedLocales: List<Locale>.from(supportedLocales),
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
