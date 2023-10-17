import 'package:injectable/injectable.dart';
import 'package:yh_basic/local_storage/hive/hive_client_primitive.dart';

@injectable
class HiveClientPrimitiveFactory {
  Future<HiveClientPrimitive<K, V>> createClient<K, V>({required String boxName}) async {
    return HiveClientPrimitive(boxName: boxName);
  }
}
