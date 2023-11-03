import 'package:fijob/di/di.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:fijob/domain/usecases/home_get_new_job_usecase.dart';
import 'package:fijob/presentation/home/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/blocs.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../domain/enities/post_entity.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, ViewState<Post>> {
  HomeBloc() : super(ViewState<Post>(data: null));

  static HomeBloc get to => getIt<HomeBloc>()..add(HomeGetPostEvent());

  final homeRepo = getIt<HomeRepository>();

  @override
  void listEvent() {
    on<HomeGetPostEvent>(_onGetPost);
  }

  void _onGetPost(HomeGetPostEvent event, Emitter<ViewState<Post>> emit) async {
    emit(state.copyWith(status: ViewStateStatus.loading));
    final response = await HomeGetNewJobUseCase(homeRepo).execute();
    response.fold((l) => emit(state.copyWith(status: ViewStateStatus.error)), (r) async {
      emit(state.copyWith(data: r.data, status: ViewStateStatus.success));
    });
  }
}
