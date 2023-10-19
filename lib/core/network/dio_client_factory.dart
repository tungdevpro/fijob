import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@lazySingleton
class DioClientFactory {
  DioHelper createClient() {
    var client = DioHelper()..init();
    return client;
  }
}
