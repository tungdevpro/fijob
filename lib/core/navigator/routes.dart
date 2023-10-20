import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/core/navigator/screens/error_screen.dart';
import 'package:fijob/presentation/getting_started/getting_started_page.dart';
import 'package:fijob/presentation/splash/splash_page.dart';
import 'package:fijob/presentation/login/login_page.dart';
import 'package:fijob/presentation/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/home_page.dart';

@immutable
abstract class Routes {
  const Routes._();

  static Map<String, WidgetBuilder> routes = {
    RoutePath.initial: (_) => const SplashPage(),
    RoutePath.home: (_) => const HomePage(),
    RoutePath.gettingStarted: (_) => const GettingStartedPage(),
    RoutePath.login: (_) => const LoginPage(),
    RoutePath.register: (_) => const RegisterPage(),
  };

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    String? routeName = settings.name?.split('?').first;

    return CupertinoPageRoute(builder: routes[routeName] ?? (_) => const Scaffold(body: ErrorScreen()), settings: settings);
  }
}