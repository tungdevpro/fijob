import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/presentation/initial/initial_page.dart';
import 'package:fijob/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
abstract class Routes {
  const Routes._();

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: RoutePath.initial, builder: (context, state) => const InitialPage()),
      GoRoute(path: RoutePath.home, builder: (context, state) => const InitialPage()),
      GoRoute(path: RoutePath.gettingStarted, builder: (context, state) => const InitialPage()),
      GoRoute(path: RoutePath.login, builder: (context, state) => const LoginPage()),
      GoRoute(path: RoutePath.register, builder: (context, state) => const InitialPage())
    ],
  );
}
