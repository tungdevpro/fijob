import 'package:equatable/equatable.dart';

enum ViewStateStatus { ready, loading, refreshing, success, empty, error }

abstract class BaseState extends Equatable {
  // const BaseState();

  @override
  String toString() => '$runtimeType';
}

class ViewState<T> extends BaseState {
  final ViewStateStatus status;
  final T? data;
  final dynamic error;

  ViewState({this.status = ViewStateStatus.ready, this.data, this.error});

  @override
  List get props => [status, data, error];

  bool get isReady => status == ViewStateStatus.ready;

  bool get isLoading => status == ViewStateStatus.loading;

  bool get isRefreshing => status == ViewStateStatus.refreshing;

  bool get isSuccess => status == ViewStateStatus.success;

  bool get isEmpty => status == ViewStateStatus.empty;

  bool get isError => status == ViewStateStatus.error;

  ViewState<T> copyWith({T? data, ViewStateStatus? status, dynamic error}) {
    return ViewState<T>(data: data ?? this.data, status: status ?? this.status, error: error ?? this.error);
  }
}
