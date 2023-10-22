import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../common/blocs/base_bloc.dart';
import '../common/blocs/base_event.dart';
import '../common/blocs/base_state.dart';

abstract class BaseStateView<P extends StatefulWidget, T extends BaseBloc<BaseEvent, BaseState>> extends State<P> {
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
}
