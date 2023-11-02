import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:fijob/data/repository_impls/home_repository_impl.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/usecases/home_get_new_job_usecase.dart';
import 'package:fijob/presentation/home/bloc/home_event.dart';
import 'package:fijob/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/base_bloc.dart';
import 'package:yh_basic/common/blocs/base_state.dart';

import '../../../data/data_source/remote/api_client_service.dart';
import '../../../domain/enities/post_entity.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(item: null));

  static HomeBloc get to => getIt<HomeBloc>()..add(HomeGetPostEvent());

  final homeRepo = HomeRepositoryImpl(getIt<ApiClientService>());

  @override
  void listEvent() {
    on<HomeGetPostEvent>(_onGetPost);
  }

  void _onGetPost(HomeGetPostEvent event, Emitter<HomeState> emit) async {
    final response = await HomeGetNewJobUseCase(homeRepo).execute();
    response.fold((l) => null, (r) {
    });
  }
}