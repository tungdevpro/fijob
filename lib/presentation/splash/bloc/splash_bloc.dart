import 'package:fijob/di/di.dart';
import 'package:fijob/presentation/splash/bloc/splash_event.dart';
import 'package:fijob/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState());

  static SplashBloc get to => getIt<SplashBloc>()..add(GetIsSkipGettingStartedEvent());

  @override
  void listEvent() {
    on<GetIsSkipGettingStartedEvent>(_onGetIsSkipGettingStartedEvent);
  }

  void _onGetIsSkipGettingStartedEvent(GetIsSkipGettingStartedEvent event, Emitter<SplashState> emit) {
    print('_onGetIsSkipGettingStartedEvent......_onGetIsSkipGettingStartedEvent');
  }
}
