import 'package:equatable/equatable.dart';

enum Status { ready, loading, refreshing, success, empty, error }

abstract class BaseState extends Equatable {
  // const BaseState();

  @override
  String toString() => '$runtimeType';
}

class ViewState<T> extends BaseState {
  final Status status;
  final T data;
  final dynamic error;

  ViewState({this.status = Status.ready, required this.data, this.error});

  @override
  List get props => [status, data, error];

  bool get isReady => status == Status.ready;

  bool get isLoading => status == Status.loading;

  bool get isRefreshing => status == Status.refreshing;

  bool get isSuccess => status == Status.success;

  bool get isEmpty => status == Status.empty;

  bool get isError => status == Status.error;
}
