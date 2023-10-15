import 'package:fijob/core/app/app_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/core/domain/domain.dart';

@singleton
class AppCubit extends Cubit<AppInfo> implements LibraryInitializer {
  AppCubit() : super(const AppInfo(status: AppStatus.none));

  @override
  Future<void> init() async {}
}
