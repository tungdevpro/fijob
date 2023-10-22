import 'package:equatable/equatable.dart';
import 'package:yh_basic/common/blocs/base_state.dart';

import '../../../../domain/validators/email_validate.dart';
import '../../../../domain/validators/fullname_validate.dart';
import '../../../../domain/validators/password_validate.dart';

enum RegisterStatus { none, success, failure, validating }

class RegisterState extends BaseState {
  final RegisterStatus status;
  final FullNameValidateModel fullName;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final bool showPassword;

  RegisterState(
      {this.status = RegisterStatus.none,
      this.fullName = const FullNameValidateModel.pure(),
      this.email = const EmailValidateModel.pure(),
      this.password = const PasswordValidateModel.pure(),
      this.showPassword = false});

  RegisterState copyWith({RegisterStatus? status, FullNameValidateModel? fullName, EmailValidateModel? email, PasswordValidateModel? password, bool? showPassword}) {
    return RegisterState(
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [status, fullName, email, password, showPassword];
}
