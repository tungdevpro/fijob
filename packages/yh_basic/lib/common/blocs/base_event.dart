import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {

  @override
  List<Object?> get props => [];

  @override
  String toString() => '$runtimeType';
}

class InitialEvent extends BaseEvent {}