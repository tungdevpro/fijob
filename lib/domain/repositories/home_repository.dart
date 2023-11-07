import 'package:dartz/dartz.dart';
import 'package:fijob/domain/enities/post_entity.dart';
import 'package:yh_basic/yh_basic.dart';

abstract class HomeRepository {
  Future<Either<dynamic, ApiResponse<List<Post>>>> getNewPost(PostRequester? params);
}