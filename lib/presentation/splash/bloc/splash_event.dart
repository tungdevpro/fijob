import 'package:yh_basic/common/blocs/base_event.dart';

abstract class SplashEvent extends BaseEvent {}

class GetIsSkipGettingStartedEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}
