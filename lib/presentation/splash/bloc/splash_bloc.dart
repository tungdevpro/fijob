import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/data/repository_impls/splash_repository_impl.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/repositories/splash_repository.dart';
import 'package:fijob/domain/usecases/check_getting_started_usecase.dart';
import 'package:fijob/presentation/splash/bloc/splash_event.dart';
import 'package:fijob/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../core/storage/local_key.dart';

@injectable
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState());

  static SplashBloc get to => getIt<SplashBloc>()..add(GetIsSkipGettingStartedEvent());

  final SplashRepository repo = getIt<SplashRepositoryImpl>();

  @override
  void listEvent() {
    on<GetIsSkipGettingStartedEvent>(_onGetIsSkipGettingStartedEvent);
  }

  void _onGetIsSkipGettingStartedEvent(GetIsSkipGettingStartedEvent event, Emitter<SplashState> emit) async {
    final isSkip = await CheckGettingStartedUseCase(repo).execute(params: StorageKey.gettingStarted);
    if (!isSkip) {
      navigator.pushNamedAndRemoveUntil(RoutePath.register);
      return;
    }
  }
}
