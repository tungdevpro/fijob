import 'package:fijob/commons/constants/app_constant.dart';
import 'package:fijob/core/navigator/routes.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/types.dart';
import 'package:yh_basic/yh_basic.dart';

void main() {
  init(
    site: const Site(id: AppConstants.id, domain: AppConstants.domain, title: AppConstants.title),
    routerConfig: Routes.router,
    startLocale: AppConstants.startLocale,
    supportedLocales: AppConstants.supportedLocales,
    loginOption: LoginOption.required,
    useCaching: true,
    providers: [
      BlocProvider(create: (_) => getIt<AuthBloc>()),
    ],
    callbacks: [
      () => SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light)),
      () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      () => configureDependencies(),
    ],
    asyncCallbacks: [
      // () => getIt<LocalStorageFactory>().createClient(boxName: "configs"),
    ],
  );
}
