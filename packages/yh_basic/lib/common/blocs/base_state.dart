import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  // const BaseState();

  @override
  String toString() => '$runtimeType';
}