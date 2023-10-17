import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/core/app/app_info.dart';
import 'package:yh_basic/yh_basic.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// ignore: must_be_immutable
class AppCubit extends Cubit<AppInfo> implements LibraryInitializer {
  AppCubit() : super(AppInfo(status: AppStatus.none, connectivityStream: Connectivity().onConnectivityChanged));

  @override
  Future<void> init() async {}
}
