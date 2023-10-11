import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String accessToken;
  final String refreshToken;
  const AuthToken({required this.accessToken, required this.refreshToken});

  const AuthToken.empty()
      : accessToken = '',
        refreshToken = '';

  AuthToken copyWith({String? accessToken, String? refreshToken}) {
    return AuthToken(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken);
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
