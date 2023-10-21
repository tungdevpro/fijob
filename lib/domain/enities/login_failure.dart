import 'package:yh_basic/domain/entities/has_displayable_failure.dart';

enum LoginFailureType {
  unknown,
  invalidCode,
  userSuspend,
  userNotFound,
  wrongPassword,
}

class LoginFailure implements HasDisplayableFailure {
  final Object? cause;
  final String? userId;
  final LoginFailureType type;

  LoginFailure.unknown([this.cause, this.userId]) : type = LoginFailureType.unknown;
  const LoginFailure.userDisabled([this.cause, this.userId]) : type = LoginFailureType.userSuspend;

  const LoginFailure.userNotFound([this.cause, this.userId]) : type = LoginFailureType.userNotFound;

  const LoginFailure.wrongPassword([this.cause, this.userId]) : type = LoginFailureType.wrongPassword;

  @override
  DisplayableFailure displayableFailure() {
    return DisplayableFailure(title: '', message: '');
  }
}
