import 'package:equatable/equatable.dart';

import '../../../domain/enities/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthUserChanged extends AuthState {
  final UserEntity? user;

  AuthUserChanged({this.user});

  @override
  List<Object?> get props => [user];
}

class AuthNotLoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLogoutRequest extends AuthState {
  @override
  List<Object?> get props => [];
}
