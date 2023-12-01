import 'package:dartz/dartz.dart';
import 'package:fijob/data/models/location_model.dart';
import 'package:fijob/domain/enities/location_requester.dart';
import 'package:fijob/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@injectable
class GetListCountryUseCase extends UseCase<Either<AppError, ApiResponse<List<LocationModel>>>, LocationRequester> {
  final LocationRepository repository;

  GetListCountryUseCase(this.repository);

  @override
  Future<Either<AppError, ApiResponse<List<LocationModel>>>> execute({LocationRequester? params}) {
    return repository.getListCountry(params);
  }
}
