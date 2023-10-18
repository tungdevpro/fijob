import 'package:fijob/domain/repositories/local_storage_repository.dart';
import 'package:yh_basic/yh_basic.dart';

class CheckGettingStartedUseCase extends UseCase<bool, NoParams?> {
  final LocalStorageRepository localStorageRepository;
  CheckGettingStartedUseCase(this.localStorageRepository);

  @override
  Future<bool> execute({NoParams? params}) {
    throw UnimplementedError();
  }
}
