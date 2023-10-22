import 'package:fijob/domain/enities/getting_started_entity.dart';
import 'package:fijob/presentation/getting_started/getting_started_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class GettingStartedCubit extends Cubit<int> implements LibraryInitializer, BlocInitializer<GettingStartedCubit> {
  GettingStartedCubit() : super(1);

  List<GettingStartedEntity> resource = GettingStartedConstants.db;

  @override
  Future<void> init() async {}

  int totalStep = 3;

  void next() {
    if (state >= totalStep) return;
    emit(state + 1);
  }

  void previous() {
    if (state <= 0) return;
    emit(state - 1);
  }

  void gotoHome() {}

  @override
  GettingStartedCubit initBloc() => GettingStartedCubit();
}
