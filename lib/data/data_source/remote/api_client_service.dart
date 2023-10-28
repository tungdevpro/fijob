import 'package:fijob/core/network/dio_client_factory.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClientService {
  ApiClientService(DioClientFactory dio);
}
