class Site {
  final String title;
  final String domain;
  final String id;
  final int? port;
  const Site({required this.id, required this.title, required this.domain, this.port});
}

class AppGlobal {
  AppGlobal._internal(Site? siteParam) {
    site = siteParam ?? const Site(id: "1", title: "Application", domain: "localhost:8080");
  }
  static AppGlobal? _instance;

  late Site site;

  factory AppGlobal.I({Site? siteParam}) => _instance ??= AppGlobal._internal(siteParam);
}
