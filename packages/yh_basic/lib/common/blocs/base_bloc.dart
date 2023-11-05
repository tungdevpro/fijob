import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yh_basic/di/di.dart';
import 'package:yh_basic/globals.dart';

import '../../navigator/app_navigator.dart';
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<T extends BaseEvent, S extends BaseState> extends Bloc<T, S> with WidgetsBindingObserver, RouteAware {
  late bool _isMounted;
  dynamic arguments;
  final navigator = getIt<AppNavigator>();

  String? _originRoute;

  String get originRoute => _originRoute ?? '';

  BaseBloc(S initState) : super(initState) {
    _isMounted = true;
    checkNetworkConnection();
    listEvent();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> close() {
    _isMounted = false;
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_isMounted) {
      switch (state) {
        case AppLifecycleState.inactive:
          onInActive();
          break;
        case AppLifecycleState.paused:
          onPaused();
          break;
        case AppLifecycleState.resumed:
          onResumed();
          break;
        case AppLifecycleState.detached:
          onDetached();
          break;
        case AppLifecycleState.hidden:
          onHidden();
      }
    }
  }

  void checkNetworkConnection([Function? handler]) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        handler?.call();
      }
    } on SocketException catch (_) {

    }
  }

  void listEvent();

  void onInActive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

  void onHidden() {}

  void initialRouteSetting(RouteSettings? settings) {
    arguments = settings?.arguments;
    _originRoute = settings?.name;
  }

  TypeArg convertArgumentToModel<TypeArg>(JsonCodec<TypeArg> cb) {
    return cb.fromJson(arguments);
  }

  void showLoading() => EasyLoading.show();

  void hideLoading() => EasyLoading.dismiss();
}
