import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/blocs/base_state.dart';
import '../common/types.dart';

class ViewStateBuilder<T, B extends BlocBase<BaseState>> extends BlocBuilder<B, BaseState> {
  ViewStateBuilder({
    Key? key,
    B? bloc,
    InitialBuilder? onReady,
    LoadingBuilder? onLoading,
    SuccessBuilder? onSuccess,
    RefreshingBuilder? onRefreshing,
    EmptyBuilder? onEmpty,
    ErrorBuilder? onError,
    Widget child = const SizedBox.shrink(),
  }) : super(
          key: key,
          bloc: bloc,
           builder: (context, state) {
            if (state is ViewState) {
              switch (state.status) {
                case Status.ready:
                  return onReady?.call(context) ?? child;
                case Status.loading:
                  return onLoading?.call(context, state.data) ?? child;
                case Status.refreshing:
                  return onRefreshing?.call(context, state.data) ?? child;
                case Status.success:
                  return onSuccess?.call(context, state.data) ?? child;
                case Status.empty:
                  return onEmpty?.call(context) ?? child;
                case Status.error:
                  return onError?.call(context, state.error) ?? child;
              }
            }
            return child;
          },
        );
}
