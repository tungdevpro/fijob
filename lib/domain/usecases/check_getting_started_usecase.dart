import 'package:fijob/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class CheckGettingStartedUseCase extends UseCase<bool, String?> {
  final SplashRepository repository;

  CheckGettingStartedUseCase(this.repository);

  @override
  Future<bool> execute({String? params}) async {
    final result = await repository.getIsSkipGettingStarted(params ?? '');
    return result.fold((l) => false, (r) => r);
  }
}
