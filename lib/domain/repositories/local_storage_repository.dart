abstract class LocalStorageRepository {
  Future<T> read<T>(String key);
}
