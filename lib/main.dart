import 'package:fijob/commons/constants/app_constant.dart';
import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/core/navigator/routes.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/presentation/auth/bloc/auth_bloc.dart';
import 'package:fijob/presentation/shared/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_lib/permission_lib.dart';
import 'package:push_notification/push_notification.dart';
import 'package:yh_basic/yh_basic.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  init(
    site: const Site(id: AppConstants.id, domain: AppConstants.domain, title: AppConstants.title, useCache: true),
    themeMode: ThemeManager.mode,
    theme: ThemeManager.light,
    initialRoute: RoutePath.initial,
    startLocale: AppConstants.startLocale,
    supportedLocales: AppConstants.supportedLocales,
    loginOption: LoginOption.required,
    onGenerateRoute: Routes.generateRoutes,
    providers: [
      BlocProvider(create: (_) => getIt<AuthBloc>()),
    ],
    callbacks: [
      () => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light)),
      () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      () => configureDependencies(),
    ],
    asyncCallbacks: [
      () => PushNotification.instance.initializeLocalNotifications(),
      () => PushNotification.instance.initializeNotificationsEventListeners(),
    ],
    callInMyApps: [
      () => PermissionLib.instance().requests([Permission.notification]),
    ],
  );
}
