import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final Object? e;
  final String? msg;

  const AppError({this.e, this.msg});

  @override
  List<Object?> get props => [e, msg];
}
