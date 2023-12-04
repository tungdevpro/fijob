import 'dart:async';

import 'package:fijob/commons/constants/app_dimens.dart';
import 'package:fijob/commons/widgets/form_location/bloc/form_location_event.dart';
import 'package:fijob/commons/widgets/form_location/bloc/form_location_state.dart';
import 'package:fijob/commons/widgets/form_location/comp/list_location_comp.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/repositories/location_repository.dart';
import 'package:fijob/domain/usecases/get_list_province_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yh_basic/shared/base_list_view/base_refresh_controller.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../../presentation/shared/bottom_sheet_menu.dart';

@injectable
class FormLocationBloc extends BaseBloc<FormLocationEvent, FormLocationState> implements LibraryInitializer {
  FormLocationBloc() : super(FormLocationState());

  // static FormLocationBloc get to => getIt<FormLocationBloc>();

  final repository = getIt<LocationRepository>();

  late BaseRefreshController refreshController;

  var ids = <String>[];

  @override
  void listEvent() {
    on<FormLocationFetchingEvent>(_onFormLocationFetching);
    on<FormLocationSelectedEvent>(_onFormLocationSelectedEvent);
  }

  void _onFormLocationFetching(FormLocationFetchingEvent event, Emitter<FormLocationState> emit) async {
    emit(FormLocationState(status: ViewStateStatus.loading));
    final response = await GetListCountryUseCase(repository).execute();
    response.fold((l) => emit(FormLocationState(status: ViewStateStatus.error)), (r) async {
      emit(FormLocationState(data: r.data, status: ViewStateStatus.success));
    });
  }

  void onDisplay() {
    add(FormLocationFetchingEvent());
    showModalBottomSheet(
      context: navigator.context,
      isScrollControlled: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius)),
      builder: (context) => BottomSheetMenu(
        title: 'Province',
        child: BlocProvider.value(value: this, child: const ListLocationComp()),
      ),
    );
  }

  @override
  Future<void> init() async {
    refreshController = BaseRefreshController(RefreshController(initialRefresh: false), handler: () {});
  }

  void _onFormLocationSelectedEvent(FormLocationSelectedEvent event, Emitter<FormLocationState> emit) {
    if (event.item == null) return;
    ids.add(event.item!.id!);
  }
}
