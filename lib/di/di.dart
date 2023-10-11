import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'initGetIt', preferRelativeImports: true, asExtension: false)
void configureDependencies() => initGetIt(getIt);
