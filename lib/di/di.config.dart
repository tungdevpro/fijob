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
import '../data/data_source/remote/api_client_service.dart' as _i10;
import '../data/repository_impls/auth_repository_impl.dart' as _i12;
import '../domain/domain.dart' as _i11;
import '../presentation/auth/bloc/auth_bloc.dart' as _i3;
import '../presentation/auth/login/bloc/login_bloc.dart' as _i7;
import '../presentation/auth/register/bloc/register_bloc.dart' as _i8;
import '../presentation/getting_started/blocs/getting_started_cubit.dart'
    as _i5;
import '../presentation/home/bloc/home_bloc.dart' as _i6;
import '../presentation/splash/blocs/splash_cubit.dart' as _i9;

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
  gh.factory<_i5.GettingStartedCubit>(() => _i5.GettingStartedCubit());
  gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
  gh.factory<_i7.LoginBloc>(() => _i7.LoginBloc());
  gh.factory<_i8.RegisterBloc>(() => _i8.RegisterBloc());
  gh.factory<_i9.SplashCubit>(() => _i9.SplashCubit());
  gh.lazySingleton<_i10.ApiClientService>(
      () => _i10.ApiClientService(gh<_i4.DioClientFactory>()));
  gh.lazySingleton<_i11.AuthRepository>(
      () => _i12.AuthRepositoryImpl(gh<_i10.ApiClientService>()));
  return getIt;
}
