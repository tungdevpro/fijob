import 'package:fijob/core/network/dio_client_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@lazySingleton
class ApiClientService {
  late DioHelper client;
  ApiClientService() {
    client = DioClientFactory().createClient();
  }
}
