import 'package:injectable/injectable.dart';
import 'package:yh_basic/yh_basic.dart';

@lazySingleton
class DioClientFactory {
  DioHelper createClient([String? baseUrl]) {
    var client = DioHelper()..init(baseUrl: baseUrl);
    return client;
  }
}
