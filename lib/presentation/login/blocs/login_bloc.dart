import 'package:fijob/data/data_sources/remote/api_client_service.dart';
import 'package:fijob/data/repository_impls/auth_repository_impl.dart';
import 'package:fijob/di/di.dart';
import 'package:fijob/domain/domain.dart';
import 'package:fijob/presentation/login/blocs/login_event.dart';
import 'package:fijob/presentation/login/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(status: LoginStatus.none)) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginTogglePasswordEvent>(_onTogglePasswordEvent);
  }

  final repo = AuthRepositoryImpl(getIt<ApiClientService>());

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {}

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {}

  void _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final result = await LoginUseCase(repo).execute(params: LoginRequest(email: event.email, password: event.password));
  }

  void _onTogglePasswordEvent(LoginTogglePasswordEvent event, Emitter<LoginState> emit) {}
}
