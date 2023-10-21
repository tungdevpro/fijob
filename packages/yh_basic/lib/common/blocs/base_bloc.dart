import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<T extends BaseEvent, S extends BaseState> extends Bloc<T, S> with WidgetsBindingObserver, RouteAware {
  late bool _isMounted;

  BaseBloc(S initState) : super(initState) {
    _isMounted = true;
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

  void listEvent();

  void onInActive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

  void onHidden() {}
}
