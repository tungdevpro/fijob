import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class TogglePasswordEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
