import 'package:dartz/dartz.dart';
import 'package:fijob/data/models/location_model.dart';
import 'package:fijob/domain/enities/location_requester.dart';
import 'package:yh_basic/common/app_error.dart';
import 'package:yh_basic/network/response/api_response.dart';

abstract class LocationRepository {
  Future<Either<AppError, ApiResponse<List<LocationModel>>>> getListCountry(LocationRequester? params);
}
