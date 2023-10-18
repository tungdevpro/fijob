import 'package:fijob/presentation/splash/blocs/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class SplashCubit extends Cubit<SplashState> implements LibraryInitializer {
  SplashCubit() : super(SplashState());

  @override
  Future<void> init() {
    throw UnimplementedError();
  }
}
