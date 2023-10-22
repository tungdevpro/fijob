// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../local_storage/hive/hive_client_primitive_factory.dart' as _i4;
import '../navigator/app_navigator.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initBasicGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AppNavigator>(() => _i3.AppNavigator());
  gh.singleton<_i4.HiveClientPrimitiveFactory>(
      _i4.HiveClientPrimitiveFactory());
  return getIt;
}
