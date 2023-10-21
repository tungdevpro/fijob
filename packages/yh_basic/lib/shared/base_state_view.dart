import 'package:flutter/material.dart';

import '../common/blocs/base_bloc.dart';
import '../common/blocs/base_event.dart';
import '../common/blocs/base_state.dart';


abstract class BaseStateView<P extends StatefulWidget, T extends BaseBloc<BaseEvent, BaseState>> extends State<P> with AutomaticKeepAliveClientMixin {

}
