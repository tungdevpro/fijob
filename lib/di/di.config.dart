// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/dio_client_factory.dart' as _i7;
import '../data/data_source/remote/api_client_service.dart' as _i3;
import '../data/repository_impls/auth_repository_impl.dart' as _i6;
import '../data/repository_impls/home_repository_impl.dart' as _i11;
import '../domain/domain.dart' as _i5;
import '../domain/repositories/home_repository.dart' as _i10;
import '../domain/usecases/home_get_new_job_usecase.dart' as _i15;
import '../presentation/auth/bloc/auth_bloc.dart' as _i4;
import '../presentation/auth/login/bloc/login_bloc.dart' as _i12;
import '../presentation/auth/register/bloc/register_bloc.dart' as _i13;
import '../presentation/getting_started/blocs/getting_started_cubit.dart'
    as _i8;
import '../presentation/home/bloc/home_bloc.dart' as _i9;
import '../presentation/splash/blocs/splash_cubit.dart' as _i14;

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
  gh.lazySingleton<_i3.ApiClientService>(() => _i3.ApiClientService());
  gh.singleton<_i4.AuthBloc>(_i4.AuthBloc());
  gh.lazySingleton<_i5.AuthRepository>(
      () => _i6.AuthRepositoryImpl(gh<_i3.ApiClientService>()));
  gh.lazySingleton<_i7.DioClientFactory>(() => _i7.DioClientFactory());
  gh.factory<_i8.GettingStartedCubit>(() => _i8.GettingStartedCubit());
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc());
  gh.lazySingleton<_i10.HomeRepository>(
      () => _i11.HomeRepositoryImpl(gh<_i3.ApiClientService>()));
  gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc());
  gh.factory<_i13.RegisterBloc>(() => _i13.RegisterBloc());
  gh.factory<_i14.SplashCubit>(() => _i14.SplashCubit());
  gh.factory<_i15.HomeGetNewJobUseCase>(
      () => _i15.HomeGetNewJobUseCase(gh<_i10.HomeRepository>()));
  return getIt;
}
