import 'package:yh_basic/local_storage/hive/hive_client.dart';
import 'package:yh_basic/globals.dart';

class HiveClientFactory {
  HiveClient<K, V> createClient<K, V>({required String boxName, required JsonCodec<V> jsonCodec}) {
    return HiveClient(boxName: boxName, jsonCodec: jsonCodec);
  }
}
