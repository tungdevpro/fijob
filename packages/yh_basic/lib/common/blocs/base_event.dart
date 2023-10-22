import 'package:equatable/equatable.dart';

abstract class BaseEvent extends Equatable {
  @override
  String toString() => '$runtimeType';
}
