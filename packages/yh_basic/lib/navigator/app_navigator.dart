import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/shared/blur_background_viewer.dart';

import '../utils/duration_provider.dart';
import 'transitions/fade_in_page_transition.dart';
import 'transitions/slide_bottom_page_transition.dart';

@injectable
class AppNavigator {
  BuildContext? _context;

  BuildContext get context => _context!;

  void setContext(BuildContext context) => _context = context;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState>? nestedNavigatorKey;

  static BuildContext get currentContext => nestedNavigatorKey?.currentContext ?? navigatorKey.currentContext!;

  static BuildContext get rootNavigatorContext => navigatorKey.currentContext!;

  Future<R?> push<R>(Route<R> route, {bool useRoot = false}) async {
    return _navigator(_context, useRoot: useRoot).push(route);
  }

  Future<R?> pushNamed<R>(String routeName, {R? arguments, bool useRoot = false}) async {
    return _navigator(_context, useRoot: useRoot).pushNamed(routeName, arguments: arguments);
  }

  Future<R?> pushReplacement<R>(Route<R> route, {bool useRoot = false}) async {
    return _navigator(_context, useRoot: useRoot).pushReplacement(route);
  }

  Future<R?> pushAndRemoveUntilRoot<R>(Route<R> route, {bool useRoot = false}) async {
    return _navigator(_context, useRoot: useRoot).pushAndRemoveUntil(route, (route) => false);
  }

  void close() => closeWithResult(null);

  void closeWithResult<T>(T result) => _navigator(_context).canPop() ? _navigator(_context).pop(result) : result;

  void popUntilRoot() => _navigator(_context).popUntil((route) => false);

  void popUntilPageWithName(String title) => _navigator(_context).popUntil(ModalRoute.withName(title));
}

NavigatorState _navigator(BuildContext? context, {bool useRoot = false}) {
  assert(!(useRoot && (context != null)), "only (useRoot = true) or (context != null) can be specified, not both");
  final rootState = AppNavigator.navigatorKey.currentState;
  if (useRoot) return rootState!;

  return context != null ? Navigator.of(context) : (AppNavigator.nestedNavigatorKey?.currentState ?? rootState!);
}

RoutePageBuilder _pageBuilder(Widget page) => (context, animation, secondaryAnimation) => page;

Route<T> noTransitionRoute<T>(Widget page, {int? durationMillis, String? pageName, bool opaque = true}) => PageRouteBuilder<T>(
      opaque: opaque,
      transitionDuration: Duration.zero,
      settings: RouteSettings(name: pageName ?? page.runtimeType.toString()),
      pageBuilder: _pageBuilder(page),
    );

Route<T> materialRoute<T>(Widget page, {bool fullScreenDialog = false, String? pageName}) =>
    MaterialPageRoute(builder: (context) => page, settings: RouteSettings(name: pageName ?? page.runtimeType.toString()), fullscreenDialog: fullScreenDialog);

Route<T> fadeInRoute<T>(
  Widget page, {
  int? durationMillis,
  String? pageName,
  bool opaque = true,
  bool fadeOut = true,
  bool fullScreenDialog = false,
}) =>
    PageRouteBuilder<T>(
      opaque: opaque,
      transitionDuration: Duration(milliseconds: durationMillis ?? Durations.medium),
      settings: RouteSettings(name: pageName ?? page.runtimeType.toString()),
      pageBuilder: _pageBuilder(page),
      transitionsBuilder: fadeInPageTransition(fadeOut: fadeOut),
      fullscreenDialog: fullScreenDialog,
    );

Route<T> displayModalRoute<T>(Widget page, {int? durationMillis, bool dismissible = true, String? pageName, Color? bgColor}) =>
    fadeInRoute(BlurBackgroundViewer(page: page, isDismissible: dismissible, bgColor: bgColor), durationMillis: durationMillis, opaque: false, fullScreenDialog: true);

Route<T> slideBottomRoute<T>(
  Widget page, {
  int? durationMillis,
  bool fullScreenDialog = false,
  String? pageName,
  bool opaque = true,
}) =>
    _transitionRoute(page, durationMillis: durationMillis, fullScreenDialog: fullScreenDialog, pageName: pageName, opaque: opaque, transitionsBuilder: slideBottomPageTransition());

Route<T> _transitionRoute<T>(Widget page,
        {int? durationMillis, bool fullScreenDialog = false, String? pageName, bool opaque = true, required RouteTransitionsBuilder transitionsBuilder}) =>
    PageRouteBuilder<T>(
      opaque: opaque,
      transitionDuration: Duration(milliseconds: durationMillis ?? Durations.medium),
      fullscreenDialog: fullScreenDialog,
      settings: RouteSettings(name: pageName ?? page.runtimeType.toString()),
      pageBuilder: _pageBuilder(page),
      transitionsBuilder: transitionsBuilder,
    );
