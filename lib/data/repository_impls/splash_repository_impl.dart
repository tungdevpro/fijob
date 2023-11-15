import 'package:dartz/dartz.dart';
import 'package:fijob/commons/constants/app_constant.dart';
import 'package:fijob/domain/enities/get_is_skip_getting_started.dart';
import 'package:fijob/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/local_storage/hive/hive_client_primitive.dart';
import 'package:yh_basic/local_storage/hive/hive_client_primitive_factory.dart';

@injectable
class SplashRepositoryImpl implements SplashRepository {
  final HiveClientPrimitiveFactory hiveClientPrimitiveFactory;

  SplashRepositoryImpl(this.hiveClientPrimitiveFactory);

  static const String _box = AppConstants.defaultBox;

  HiveClientPrimitive<String, int> get hiveClient => hiveClientPrimitiveFactory.createClient(boxName: _box);

  @override
  Future<Either<GetIsSkipGettingStartedFailure, bool>> getIsSkipGettingStarted(String key) async {
    try {
      final result = await hiveClient.read(key);
      return result.fold((l) => Left(GetIsSkipGettingStartedFailure(l.msg)), (r) => Right(r != null ? (r == 1) : false));
    } catch (e) {
      print('e..........$e');
      return left(GetIsSkipGettingStartedFailure(e.toString()));
    }
  }

  @override
  Future<void> confirmSkipGettingStarted(String key) async {
    try {
      await hiveClient.save(key, 1);
    } catch (e) {
      print('eror........... $e');
    }
  }
}
