import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthInitialEvent extends AuthEvent {
  const AuthInitialEvent();

  @override
  List<Object?> get props => [];
}

class NotAuthorizeEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SuccessAuthorizeEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
