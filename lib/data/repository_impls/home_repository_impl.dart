import 'package:dartz/dartz.dart';
import 'package:fijob/data/data_source/remote/api_client_service.dart';
import 'package:fijob/domain/enities/post_entity.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/api_response.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiClientService service;
  HomeRepositoryImpl(this.service);

  @override
  Future<Either<dynamic, ApiResponse<Post>>> getNewPost() async {
    try {
      final response = await service.client.get<Post>('/todos/1', convertJson: (message) => Post.fromJson(message));
      return right<dynamic, ApiResponse<Post>>(response);
    } catch(e) {
      return left<dynamic, ApiResponse<Post>>(e);
    }
  }
}