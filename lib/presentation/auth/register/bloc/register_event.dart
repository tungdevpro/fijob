import 'package:yh_basic/common/blocs/base_event.dart';

abstract class RegisterEvent extends BaseEvent {}

class RegisterFullNameChanged extends RegisterEvent {
  final String fullName;

  RegisterFullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}
class RegisterEmailChanged extends RegisterEvent {
  final String email;
  RegisterEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;
  RegisterPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class TogglePasswordEvent extends RegisterEvent {
  @override
  List<Object?> get props => [];
}

class RegisterNextStepCompleteEvent extends RegisterEvent {
  final bool isNextComplete;
  RegisterNextStepCompleteEvent(this.isNextComplete);

  @override
  List<Object?> get props => [isNextComplete];
}