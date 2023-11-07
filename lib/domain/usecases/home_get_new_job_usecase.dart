import 'package:dartz/dartz.dart';
import 'package:fijob/domain/enities/post_entity.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class HomeGetNewJobUseCase extends UseCase<Either<dynamic, ApiResponse<List<Post>>>, PostRequester> {
  final HomeRepository repository;

  HomeGetNewJobUseCase(this.repository);

  @override
  Future<Either<dynamic, ApiResponse<List<Post>>>> execute({PostRequester? params}) async {
    return await repository.getNewPost(params);
  }
}
