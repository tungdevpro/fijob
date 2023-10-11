import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<int> {
  IntroCubit() : super(0);

  void next() => emit(state + 1);
  void previous() => emit(state - 1);
}
