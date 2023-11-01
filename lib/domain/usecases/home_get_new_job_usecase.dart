import 'package:dartz/dartz.dart';
import 'package:fijob/domain/enities/post_entity.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class HomeGetNewJobUseCase extends UseCase<Either<dynamic, ApiResponse<Post>>, NoParams> {
  final HomeRepository repository;

  HomeGetNewJobUseCase(this.repository);

  @override
  Future<Either<dynamic, ApiResponse<Post>>> execute({NoParams? params}) async {
    return await repository.getNewPost();
  }
}
