import 'package:dartz/dartz.dart';
import 'package:fijob/core/network/api_path.dart';
import 'package:fijob/data/data_source/remote/api_client_service.dart';
import 'package:fijob/domain/enities/post_entity.dart';
import 'package:fijob/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final ApiClientService service;

  HomeRepositoryImpl(this.service);

  @override
  Future<Either<AppError, ApiResponse<List<Post>>>> getNewPost(PostRequester? params) async {
    try {
      final response = await service.client.get<List<Post>>(ApiPath.listPost,
          queryParameters: params?.toJson(), convertJson: (message) => message.map((e) => Post.fromJson(e)).toList().cast<Post>());
      return right<AppError, ApiResponse<List<Post>>>(response);
    } catch (e) {
      return left<AppError, ApiResponse<List<Post>>>(AppError(e: e));
    }
  }
}
