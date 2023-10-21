import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';

class AppBlocObserver extends BlocObserver with LogMixin {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // dLog('[BLOC_CHANGE]: $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    dLog('[BLOC_CREATE]: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    dLog('[BLOC_ERROR]: $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // dLog('[BLOC TRANSITION]: $transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dLog('[BLOC_CLOSE]: $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // dLog('[BLOC_EVENT]: $bloc - $event');
  }
}