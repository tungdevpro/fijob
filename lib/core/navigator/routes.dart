import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/core/navigator/screens/error_screen.dart';
import 'package:fijob/presentation/getting_started/getting_started_page.dart';
import 'package:fijob/presentation/splash/splash_page.dart';
import 'package:fijob/presentation/login/login_page.dart';
import 'package:fijob/presentation/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/home/home_page.dart';

@immutable
abstract class Routes {
  const Routes._();

  static GoRouter router = GoRouter(
    errorBuilder: (_, __) => const ErrorScreen(),
    routes: [
      GoRoute(path: RoutePath.initial, builder: (context, state) => const SplashPage()),
      GoRoute(path: RoutePath.home, builder: (context, state) => const HomePage()),
      GoRoute(path: RoutePath.gettingStarted, builder: (context, state) => const GettingStartedPage()),
      GoRoute(path: RoutePath.login, builder: (context, state) => const LoginPage()),
      GoRoute(path: RoutePath.register, builder: (context, state) => const RegisterPage())
    ],
  );
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(Tween(begin: const Offset(1.5, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
              child: child,
            );
          },
        );
}
