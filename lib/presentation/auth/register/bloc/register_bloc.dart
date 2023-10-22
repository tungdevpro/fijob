import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/blocs/base_bloc.dart';
import 'package:yh_basic/domain/domain.dart';

import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> implements BlocInitializer<RegisterBloc> {
  RegisterBloc() : super(RegisterState(status: RegisterStatus.none));

  @override
  void listEvent() {
    on<RegisterFullNameChanged>(_onRegisterFullNameChanged);
    on<RegisterEmailChanged>(_onRegisterEmailChanged);
    on<RegisterPasswordChanged>(_onRegisterPasswordChanged);
    on<TogglePasswordEvent>(_onTogglePasswordEvent);
  }

  void _onRegisterFullNameChanged(RegisterFullNameChanged event, Emitter<RegisterState> emit) {}
  void _onRegisterEmailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {}
  void _onRegisterPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {}
  void _onTogglePasswordEvent(TogglePasswordEvent event, Emitter<RegisterState> emit) {}

  @override
  RegisterBloc initBloc() => RegisterBloc();
}
