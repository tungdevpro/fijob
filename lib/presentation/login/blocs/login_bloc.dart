import 'package:fijob/presentation/login/blocs/login_event.dart';
import 'package:fijob/presentation/login/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(status: LoginStatus.none));
}
