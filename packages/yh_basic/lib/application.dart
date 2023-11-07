import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yh_basic/navigator/app_navigator.dart';
import 'package:yh_basic/yh_basic.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';


class Application extends StatefulWidget {
  final Locale? startLocale;
  final ThemeMode? themeMode;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final List<Locale>? supportedLocales;
  final Locale? fallbackLocale;
  final List<AsyncCallbackFunc>? callInMyApps;
  final RouteFactory? onGenerateRoute;
  final String initialRoute;

  const Application({
    Key? key,
    this.startLocale,
    this.themeMode,
    this.theme,
    this.darkTheme,
    this.supportedLocales,
    this.fallbackLocale,
    this.callInMyApps,
    this.onGenerateRoute,
    required this.initialRoute,
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
        return MaterialApp(
          navigatorKey: AppNavigator.navigatorKey,
          title: AppGlobal.I().site.title,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: widget.onGenerateRoute,
          initialRoute: widget.initialRoute,
          darkTheme: widget.darkTheme,
          themeMode: widget.themeMode,
          theme: widget.theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: EasyLoading.init(
            builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!),
          ),
        );
      },
    );
  }
}
