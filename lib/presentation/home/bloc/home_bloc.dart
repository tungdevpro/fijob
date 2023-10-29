import 'package:fijob/di/di.dart';
import 'package:fijob/presentation/home/bloc/home_event.dart';
import 'package:fijob/presentation/home/bloc/home_state.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/base_bloc.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState());

  static HomeBloc get to => getIt<HomeBloc>();

  @override
  void listEvent() {
  }

}