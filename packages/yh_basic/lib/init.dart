import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/application.dart';
import 'package:yh_basic/common/types.dart';
import 'package:yh_basic/yh_basic.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

import 'di/di.dart';

void init({
  required Site site,
  Widget? child,
  List<String> boxs = const [],
  ThemeData? theme,
  ThemeMode themeMode = ThemeMode.light,
  ThemeData? darkTheme,
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
  Locale? startLocale,
  List<AsyncCallbackFunc>? asyncCallbacks,
  List<AsyncCallbackFunc>? callInMyApps,
  List<VoidCallback>? callbacks,
  LoginOption loginOption = LoginOption.none,
  required List<SingleChildWidget> providers,
  RouteFactory? onGenerateRoute,
  required String initialRoute,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();

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

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppCubit(connectivityStream: Connectivity().onConnectivityChanged)..init()),
        ...providers,
      ],
      child: Application(
        initialRoute: initialRoute,
        theme: theme,
        themeMode: themeMode,
        darkTheme: darkTheme,
        onGenerateRoute: onGenerateRoute,
        startLocale: startLocale,
        supportedLocales: List<Locale>.from(supportedLocales),
        callInMyApps: callInMyApps,
        fallbackLocale: startLocale,
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
