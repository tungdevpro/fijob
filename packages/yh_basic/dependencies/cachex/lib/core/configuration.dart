const defaultDay = 7;

class Configuration {
  final String databaseName;
  final String? baseUrl;
  final Duration defaultMaxAge;

  Configuration({
    this.databaseName = "cache-db",
    required this.baseUrl,
    this.defaultMaxAge = const Duration(days: defaultDay),
  });
}
