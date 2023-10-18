import 'package:injectable/injectable.dart';
import 'package:yh_basic/local_storage/hive/hive_client_primitive.dart';

@singleton
class HiveClientPrimitiveFactory {
  HiveClientPrimitive<K, V> createClient<K, V>({required String boxName}) {
    return HiveClientPrimitive(boxName: boxName);
  }
}
