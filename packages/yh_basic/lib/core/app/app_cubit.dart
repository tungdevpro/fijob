import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yh_basic/core/app/app_info.dart';
import 'package:yh_basic/yh_basic.dart';

// ignore: must_be_immutable
class AppCubit extends Cubit<AppInfo> implements LibraryInitializer {
  AppCubit() : super(const AppInfo(status: AppStatus.none)) {}

  @override
  Future<void> init() async {}
}
