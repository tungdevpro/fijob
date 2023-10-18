// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/dio_client_factory.dart' as _i4;
import '../core/storage/hive_client_primitive_factory.dart' as _i5;
import '../data/data_sources/remote/api_client_service.dart' as _i8;
import '../data/repository_impls/auth_repository_impl.dart' as _i9;
import '../presentation/auth/blocs/auth_bloc.dart' as _i3;
import '../presentation/login/blocs/login_bloc.dart' as _i6;
import '../presentation/splash/blocs/splash_cubit.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AuthBloc>(_i3.AuthBloc());
  gh.lazySingleton<_i4.DioClientFactory>(() => _i4.DioClientFactory());
  gh.singleton<_i5.HiveClientPrimitiveFactory>(
      _i5.HiveClientPrimitiveFactory());
  gh.factory<_i6.LoginBloc>(() => _i6.LoginBloc());
  gh.factory<_i7.SplashCubit>(() => _i7.SplashCubit());
  gh.lazySingleton<_i8.ApiClientService>(
      () => _i8.ApiClientService(gh<_i4.DioClientFactory>()));
  gh.lazySingleton<_i9.AuthRepositoryImpl>(
      () => _i9.AuthRepositoryImpl(gh<_i8.ApiClientService>()));
  return getIt;
}
