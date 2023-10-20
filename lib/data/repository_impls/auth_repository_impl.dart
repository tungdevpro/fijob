import 'package:dartz/dartz.dart';
import 'package:fijob/data/data_sources/remote/api_client_service.dart';
import 'package:fijob/domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(ApiClientService service);

  @override
  Future<Either<LoginFailure?, AuthToken?>> login(LoginRequest? params) {
    throw UnimplementedError();
  }
}
