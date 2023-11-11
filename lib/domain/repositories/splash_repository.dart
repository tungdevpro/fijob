import 'package:dartz/dartz.dart';

import '../enities/get_is_skip_getting_started.dart';

abstract class SplashRepository {
  Future<Either<GetIsSkipGettingStartedFailure, bool>> getIsSkipGettingStarted(String key);
}
