import 'package:cachex/cachex.dart';
import 'package:cachex/core/cache_store.dart';
import 'package:cachex/models/data_local.dart';

import '../stores/disk_store.dart';

class CacheManager {
  final Configuration _configuration;
  late CacheStore _store;

  CacheManager(this._configuration) {
    _store = DiskStore(dbName: _configuration.databaseName);
  }

  Future<DataLocal?> _pullFromCache(String key) async {
    final result = await _store.getData(key);
    if (result != null) {
      await _store.setData(result);
    }

    var now = DateTime.now().millisecondsSinceEpoch;
    if (result?.maxAge != null && result!.maxAge! < now) {
      await delete(key);
    }
    return result;
  }

  Future<bool> pushCaching(DataLocal dataLocal) async {
    if (dataLocal.maxAge == null || dataLocal.maxAge! <= 0) {
      return Future.value(false);
    }
    return _store.setData(dataLocal);
  }

  Future<bool> delete(String key) {
    return _store.delete(key);
  }

  Future clearAll() async {
    await _store.clearAll();
  }
}
