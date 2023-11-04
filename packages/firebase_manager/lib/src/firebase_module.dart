class FirebaseModule {
  static FirebaseModule? _instance;

  factory FirebaseModule() => _instance ??= FirebaseModule();
}
