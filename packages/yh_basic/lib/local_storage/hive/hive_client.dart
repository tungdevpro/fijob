import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:dartz/dartz.dart';
import 'package:yh_basic/common/types.dart';
import 'package:yh_basic/yh_basic.dart';

class HiveClient<K, V> {
  final String boxName;
  final JsonCodec<V?> jsonCodec;

  const HiveClient({required this.boxName, required this.jsonCodec});

  Future<Box<String>> get _box => Hive.isBoxOpen(boxName) ? Future.value(Hive.box(boxName)) : Hive.openBox(boxName);

  Future<Either<String, Unit>> put(K key, V? value) async {
    try {
      final box = await _box;
      if (value != null) {
        final jsonString = compute(toJsonMethod, jsonCodec.toJson(value));
        await box.put(key, await jsonString);
      } else {
        await box.delete(key);
      }
      return success(unit);
    } catch (e) {
      return failure(e.toString());
    }
  }
}
