import 'package:fijob/core/navigator/route_path.dart';
import 'package:fijob/core/storage/local_key.dart';
import 'package:fijob/data/repository_impls/splash_repository_impl.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/enities/getting_started_entity.dart';
import 'package:fijob/presentation/getting_started/getting_started_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/navigator/app_navigator.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class GettingStartedCubit extends Cubit<int> implements LibraryInitializer {
  GettingStartedCubit() : super(1) {
    init();
  }

  final repo = getIt<SplashRepositoryImpl>();
  late AppNavigator appNavigator;

  List<GettingStartedEntity> resource = GettingStartedConstants.db;

  @override
  Future<void> init() async {
    appNavigator = getIt<AppNavigator>();
  }

  int totalStep = 3;

  void next() {
    if (state >= totalStep) return;
    emit(state + 1);
  }

  void previous() {
    if (state <= 0) return;
    emit(state - 1);
  }

  void nextStep() {
    if (state >= totalStep) {
      repo.confirmSkipGettingStarted(StorageKey.gettingStarted);
      appNavigator.pushNamed<dynamic>(RoutePath.register);
      return;
    }
    next();
  }

  void setContext(BuildContext context) {
    appNavigator.setContext(context);
  }
}
