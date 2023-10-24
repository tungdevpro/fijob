import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../common/blocs/base_bloc.dart';
import '../common/blocs/base_event.dart';
import '../common/blocs/base_state.dart';

abstract class BaseStateView<P extends StatefulWidget, T extends BaseBloc<BaseEvent, BaseState>> extends State<P> {
  T? _bloc;
  T get bloc => _bloc!;

  @override
  void initState() {
    super.initState();
    _bloc = initBloc;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc?.initialRouteSetting(ModalRoute.of(context)?.settings);
    });
  }

  T get initBloc => context.read<T>();
}
