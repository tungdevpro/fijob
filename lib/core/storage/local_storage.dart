import 'package:fijob/core/storage/i_local_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:yh_basic/local_storage/hive/hive_client_primitive_factory.dart';

@injectable
class LocalStorage implements ILocalStorage {
  final HiveClientPrimitiveFactory hiveClientPrimitiveFactory;

  LocalStorage(this.hiveClientPrimitiveFactory);
}