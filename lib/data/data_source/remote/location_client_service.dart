import 'package:fijob/commons/constants/app_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

import '../../../core/network/dio_client_factory.dart';

@lazySingleton
class MockClientService {
  late DioHelper client;
  MockClientService() {
    client = DioClientFactory().createClient(AppConstants.mockApi);
  }
}
