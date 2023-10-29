import 'package:yh_basic/yh_basic.dart';

import '../../../../domain/validators/email_validate.dart';
import '../../../../domain/validators/password_validate.dart';

enum LoginStatus { none, success, failure, validating }

class LoginState extends BaseState {
  final LoginStatus status;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final bool showPassword;

  LoginState(
      {this.status = LoginStatus.none,
      this.email = const EmailValidateModel.pure(),
      this.password = const PasswordValidateModel.pure(),
      this.showPassword = false});

  LoginState copyWith({LoginStatus? status, EmailValidateModel? email, PasswordValidateModel? password, bool? showPassword}) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [status, email, password, showPassword];
}
