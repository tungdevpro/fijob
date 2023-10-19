import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/core/app/app_cubit.dart';
import 'package:yh_basic/core/app/app_info.dart';
import 'package:yh_basic/yh_basic.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'types.dart';

class Application extends StatefulWidget {
  final Locale? startLocale;
  final ThemeMode? themeMode;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final List<Locale>? supportedLocales;
  final Locale? fallbackLocale;
  final List<AsyncCallbackFunc>? callInMyApps;
  final RouterConfig<Object> routerConfig;

  const Application({
    Key? key,
    this.startLocale,
    this.themeMode,
    this.theme,
    this.darkTheme,
    this.supportedLocales,
    this.fallbackLocale,
    this.callInMyApps,
    required this.routerConfig,
  }) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    if (widget.callInMyApps?.isNotEmpty ?? false) {
      for (var element in widget.callInMyApps!) {
        element.call();
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppInfo>(
      builder: (context, state) {
        return MaterialApp.router(
          title: AppGlobal.I().site.title,
          debugShowCheckedModeBanner: false,
          routerConfig: widget.routerConfig,
          darkTheme: widget.darkTheme,
          themeMode: widget.themeMode,
          theme: widget.theme,
          locale: widget.startLocale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: widget.supportedLocales ?? <Locale>[],
        );
      },
    );
  }
}
