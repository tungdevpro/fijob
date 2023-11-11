import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/local_storage_failure.dart';
import '../../utils/either_extensions.dart';

class HiveClientPrimitive<K, V> {
  const HiveClientPrimitive({required this.boxName});

  final String boxName;

  Future<Box<V>> get _box => Hive.isBoxOpen(boxName) ? Future.value(Hive.box(boxName)) : Hive.openBox(boxName);

  Future<Either<LocalStorageFailure, Unit>> save(K key, V? value) async {
    try {
      final box = await _box;
      if (value != null) {
        await box.put(key, value);
      } else {
        await box.delete(key);
      }
      return success(unit);
    } catch (ex) {
      return failure(LocalStorageFailure.unknown(ex));
    }
  }

  Future<Either<LocalStorageFailure, V?>> read(K key) async {
    try {
      final box = await _box;
      final result = box.get(key);
      return success(result);
    } catch (ex) {
      return failure(LocalStorageFailure.unknown(ex));
    }
  }
}
