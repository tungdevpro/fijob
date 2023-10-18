import 'package:dartz/dartz.dart';
import 'package:fijob/domain/domain.dart';
import 'package:yh_basic/yh_basic.dart';

class LoginUseCase extends UseCase<Either<LoginFailure?, AuthToken?>, LoginRequest?> {
  final AuthRepository repo;
  LoginUseCase(this.repo);

  @override
  Future<Either<LoginFailure?, AuthToken?>> execute({LoginRequest? params}) {
    return repo.login(params);
  }
}

class LoginRequest {
  final String? email;
  final String? password;

  LoginRequest({this.email, this.password});
}
