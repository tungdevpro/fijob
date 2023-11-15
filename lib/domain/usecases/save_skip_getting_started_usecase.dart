import 'package:fijob/domain/repositories/splash_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class SaveSkipGettingStartedUseCase extends UseCase<void, String> {
  final SplashRepository repository;

  SaveSkipGettingStartedUseCase(this.repository);

  @override
  Future<void> execute({String? params}) async {
    return repository.confirmSkipGettingStarted(params!);
  }
}
