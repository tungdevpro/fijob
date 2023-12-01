import 'package:dartz/dartz.dart';
import 'package:fijob/core/network/api_path.dart';
import 'package:fijob/data/data_source/remote/location_client_service.dart';
import 'package:fijob/data/models/location_model.dart';
import 'package:fijob/domain/enities/location_requester.dart';
import 'package:fijob/domain/repositories/location_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/common/app_error.dart';
import 'package:yh_basic/network/response/api_response.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl extends LocationRepository {
  final MockClientService service;

  LocationRepositoryImpl(this.service);

  @override
  Future<Either<AppError, ApiResponse<List<LocationModel>>>> getListCountry(LocationRequester? params) async {
    try {
      final response = await service.client.get<List<LocationModel>>(MockPath.listCountry,
          queryParameters: params?.toJson(),
          convertJson: (message) => message.map((e) => LocationModel.fromJson(e)).toList().cast<LocationModel>());
      return right<AppError, ApiResponse<List<LocationModel>>>(response);
    } catch (e) {
      return left<AppError, ApiResponse<List<LocationModel>>>(AppError(e: e));
    }
  }
}
