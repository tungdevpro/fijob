import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../common/blocs/base_bloc.dart';
import '../common/blocs/base_event.dart';
import '../common/blocs/base_state.dart';

abstract class BaseStateView<P extends StatefulWidget, T extends BaseBloc<BaseEvent, BaseState>> extends State<P> with AutomaticKeepAliveClientMixin {
  T get bloc => GetIt.I<T>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initBloc();
    });
  }

  @mustCallSuper
  void initBloc();

  @override
  bool get wantKeepAlive => false;

  @override
  void dispose() {
    GetIt.I.resetLazySingleton<T>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider.value(
      value: bloc,
      child: Builder(builder: (context) => buildChild(context)),
    );
  }

  Widget buildChild(BuildContext context);
}
