import 'dart:async';

import 'package:fijob/commons/constants/app_constant.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:fijob/domain/usecases/home_get_new_job_usecase.dart';
import 'package:fijob/presentation/home/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yh_basic/shared/base_list_view/base_refresh_controller.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../domain/enities/post_entity.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, ViewState<List<Post>>> implements LibraryInitializer {
  HomeBloc() : super(ViewState<List<Post>>(data: null));

  static HomeBloc get to => getIt<HomeBloc>()..init();
  // ..add(HomeGetPostEvent());

  final homeRepo = getIt<HomeRepository>();
  late BaseRefreshController refreshController;

  @override
  Future<void> init() async {
    refreshController = BaseRefreshController(RefreshController(initialRefresh: false), handler: onHandler);
  }

  void onHandler() {}

  @override
  void listEvent() {
    on<HomeGetPostEvent>(_onGetPost);
    on<HomeRefreshPostEvent>(_onRefreshPost);
  }

  void _onGetPost(HomeGetPostEvent event, Emitter<ViewState<List<Post>>> emit) async {
    emit(state.copyWith(status: ViewStateStatus.loading));
    final response = await HomeGetNewJobUseCase(homeRepo).execute(params: PostRequester(start: AppConstants.page, limit: 3));
    response.fold((l) => emit(state.copyWith(status: ViewStateStatus.error)), (r) async {
      emit(state.copyWith(data: r.data, status: ViewStateStatus.success));
    });
  }

  void toggle() async {
    showLoading();
    await Future.delayed(const LongDuration());
    hideLoading();
  }

  @override
  Future<void> close() {
    refreshController.onClose();
    return super.close();
  }

  void _onRefreshPost(HomeRefreshPostEvent event, Emitter<ViewState<List<Post>>> emit) async {
    print('HomeRefreshPostEvent------->> ');
    refreshController.onRefresh();
  }
}
