import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/yh_basic.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'app_info.dart';

// ignore: must_be_immutable
class AppCubit extends Cubit<AppInfo> implements LibraryInitializer {
  final Stream<ConnectivityResult> connectivityStream;
  AppCubit({required this.connectivityStream}) : super(AppInfo(status: AppStatus.none, connectivityStream: connectivityStream));

  @override
  Future<void> init() async {
    // emit(state.copyWith(skipGettingStarted: true, connectivityStream: Connectivity().onConnectivityChanged));
  }

  void handleSkipGettingStarted() {
    emit(state.copyWith(skipGettingStarted: true, connectivityStream: connectivityStream));
  }
}
