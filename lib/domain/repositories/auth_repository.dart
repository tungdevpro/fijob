import 'package:dartz/dartz.dart';
import 'package:fijob/domain/enities/auth_token.dart';
import 'package:fijob/domain/enities/login_failure.dart';
import 'package:fijob/domain/usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure?, AuthToken?>> login(LoginRequest? params);
}
