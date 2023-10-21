import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> execute({Params params});
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
