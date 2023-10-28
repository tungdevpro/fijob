import 'package:fijob/data/data_source/remote/api_client_service.dart';
import 'package:fijob/data/repository_impls/auth_repository_impl.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/domain.dart';
import 'package:fijob/domain/validators/email_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/base_bloc.dart';

import '../../../../domain/validators/password_validate.dart';
import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(status: LoginStatus.none));

  static LoginBloc get to => getIt<LoginBloc>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repo = AuthRepositoryImpl(getIt<ApiClientService>());

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final emailModel = EmailValidateModel.dirty(event.email);
    emit(state.copyWith(status: LoginStatus.validating, email: emailModel));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final pwdModel = PasswordValidateModel.dirty(event.password);
    emit(state.copyWith(status: LoginStatus.validating, password: pwdModel));
  }

  void _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final result = await LoginUseCase(repo).execute(params: LoginRequest(email: event.email, password: event.password));
  }

  void _onTogglePasswordEvent(LoginTogglePasswordEvent event, Emitter<LoginState> emit) {}

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  @override
  void listEvent() {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginTogglePasswordEvent>(_onTogglePasswordEvent);
  }
}
