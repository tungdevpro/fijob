import 'package:fijob/data/models/location_model.dart';
import 'package:yh_basic/yh_basic.dart';

abstract class FormLocationEvent extends BaseEvent {}

class FormLocationFetchingEvent extends FormLocationEvent {}

class FormLocationSearchingEvent extends FormLocationEvent {
  final String? keyword;
  FormLocationSearchingEvent({this.keyword});

  @override
  List<Object?> get props => [keyword];
}

class FormLocationSelectedEvent extends FormLocationEvent {
  final LocationModel? item;
  FormLocationSelectedEvent({this.item});

  @override
  List<Object?> get props => [item];
}
