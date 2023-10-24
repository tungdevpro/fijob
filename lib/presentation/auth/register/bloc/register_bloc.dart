import 'package:fijob/domain/validators/password_validate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/base_bloc.dart';

import '../../../../di/di.dart';
import '../../../../domain/validators/email_validate.dart';
import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(status: RegisterStatus.none));

  static RegisterBloc get to => getIt<RegisterBloc>();

  @override
  void listEvent() {
    on<RegisterNextStepCompleteEvent>(_onRegisterNextStepCompleteEvent);
    on<RegisterFullNameChanged>(_onRegisterFullNameChanged);
    on<RegisterEmailChanged>(_onRegisterEmailChanged);
    on<RegisterPasswordChanged>(_onRegisterPasswordChanged);
    on<TogglePasswordEvent>(_onTogglePasswordEvent);
  }

  void _onRegisterFullNameChanged(RegisterFullNameChanged event, Emitter<RegisterState> emit) {}

  void _onRegisterEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final emailModel = EmailValidateModel.dirty(event.email);
    emit(state.copyWith(status: RegisterStatus.validating, email: emailModel));
  }

  void _onRegisterPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final pwdModel = PasswordValidateModel.dirty(event.password);
    emit(state.copyWith(status: RegisterStatus.validating, password: pwdModel));
  }

  void _onTogglePasswordEvent(TogglePasswordEvent event, Emitter<RegisterState> emit) {}

  void _onRegisterNextStepCompleteEvent(RegisterNextStepCompleteEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isNextComplete: true));
  }
}
