bool empty([dynamic data, bool hasZero = false]) {
  if (data == null) return true;
  if ((data is Map || data is List) && data.length == 0) return true;
  if ((data is Map || data is Iterable) && data.isEmpty) return true;
  if (data is bool) return !data;
  if ((data is String || data is num) && (data == '0' || data == 0)) return hasZero;

  return data.toString().isEmpty;
}
