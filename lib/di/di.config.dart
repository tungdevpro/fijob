// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/navigator/app_navigator.dart' as _i3;
import '../core/network/dio_client_factory.dart' as _i5;
import '../data/data_sources/remote/api_client_service.dart' as _i9;
import '../data/repository_impls/auth_repository_impl.dart' as _i11;
import '../domain/domain.dart' as _i10;
import '../presentation/auth/blocs/auth_bloc.dart' as _i4;
import '../presentation/getting_started/blocs/getting_started_cubit.dart'
    as _i6;
import '../presentation/login/blocs/login_bloc.dart' as _i7;
import '../presentation/splash/blocs/splash_cubit.dart' as _i8;

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
  gh.lazySingleton<_i3.AppNavigator>(() => _i3.AppNavigator());
  gh.singleton<_i4.AuthBloc>(_i4.AuthBloc());
  gh.lazySingleton<_i5.DioClientFactory>(() => _i5.DioClientFactory());
  gh.factory<_i6.GettingStartedCubit>(() => _i6.GettingStartedCubit());
  gh.factory<_i7.LoginBloc>(() => _i7.LoginBloc());
  gh.factory<_i8.SplashCubit>(() => _i8.SplashCubit());
  gh.lazySingleton<_i9.ApiClientService>(
      () => _i9.ApiClientService(gh<_i5.DioClientFactory>()));
  gh.lazySingleton<_i10.AuthRepository>(
      () => _i11.AuthRepositoryImpl(gh<_i9.ApiClientService>()));
  return getIt;
}
