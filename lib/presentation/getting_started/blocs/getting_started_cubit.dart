import 'package:fijob/domain/enities/getting_started_entity.dart';
import 'package:fijob/presentation/getting_started/components/getting_started_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/core/domain/domain.dart';

@injectable
class GettingStartedCubit extends Cubit<int> implements LibraryInitializer {
  GettingStartedCubit() : super(1) {
    init();
  }

  List<GettingStartedEntity> resource = GettingStartedConstants.db;

  @override
  Future<void> init() async {
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

  void gotoHome() {}
}
