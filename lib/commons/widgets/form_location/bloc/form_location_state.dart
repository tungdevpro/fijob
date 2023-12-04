// ignore_for_file: unnecessary_overrides

import 'package:yh_basic/yh_basic.dart';

import '../../../../data/models/location_model.dart';

class FormLocationState extends ViewState<List<LocationModel>> {
  FormLocationState({ViewStateStatus status = ViewStateStatus.none, List<LocationModel>? data, dynamic error})
      : super(data: data, status: status, error: error);

  @override
  ViewState<List<LocationModel>> copyWith({List<LocationModel>? data, ViewStateStatus? status, error, List<String>? ids}) {
    return super.copyWith(data: data, status: status, error: error);
  }
}
