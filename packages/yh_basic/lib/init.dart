import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/application.dart';
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
  String translatePath = 'assets/translations',
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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

  final supLocales = List<Locale>.from(supportedLocales);

  runApp(
    EasyLocalization(
      path: translatePath,
      startLocale: startLocale,
      supportedLocales: supLocales,
      child: MultiBlocProvider(
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
          supportedLocales: supLocales,
          callInMyApps: callInMyApps,
          fallbackLocale: startLocale,
        ),
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
