import '../models/data_local.dart';

abstract class CacheStore {
  CacheStore();

  Future<DataLocal?> getData(String key, {String? subKey});

  Future<bool> setData(DataLocal obj);

  Future<bool> delete(String key, {String? subKey});

  Future<bool> clearExpired();

  Future<bool> clearAll();
}