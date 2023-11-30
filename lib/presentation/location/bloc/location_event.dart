import 'package:yh_basic/yh_basic.dart';

abstract class LocationEvent extends BaseEvent {}

class LocationFetching extends LocationEvent {}

class LocationSearching extends LocationEvent {
  final String? keyword;
  LocationSearching({this.keyword});

  @override
  List<Object?> get props => [keyword];
}
