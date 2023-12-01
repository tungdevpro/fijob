import 'package:yh_basic/yh_basic.dart';

abstract class FormLocationEvent extends BaseEvent {}

class FormLocationFetchingEvent extends FormLocationEvent {}

class FormLocationSearching extends FormLocationEvent {
  final String? keyword;
  FormLocationSearching({this.keyword});

  @override
  List<Object?> get props => [keyword];
}
