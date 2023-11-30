// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:yh_basic/local_storage/hive/hive_client_primitive_factory.dart'
    as _i21;

import '../core/network/dio_client_factory.dart' as _i9;
import '../data/data_source/remote/api_client_service.dart' as _i3;
import '../data/data_source/remote/location_client_service.dart' as _i14;
import '../data/data_source/remote/placeholder_client_service.dart' as _i16;
import '../data/repository_impls/auth_repository_impl.dart' as _i6;
import '../data/repository_impls/home_repository_impl.dart' as _i13;
import '../data/repository_impls/splash_repository_impl.dart' as _i20;
import '../domain/domain.dart' as _i5;
import '../domain/repositories/home_repository.dart' as _i12;
import '../domain/repositories/splash_repository.dart' as _i8;
import '../domain/usecases/check_getting_started_usecase.dart' as _i7;
import '../domain/usecases/home_get_new_job_usecase.dart' as _i22;
import '../domain/usecases/save_skip_getting_started_usecase.dart' as _i18;
import '../presentation/auth/bloc/auth_bloc.dart' as _i4;
import '../presentation/auth/login/bloc/login_bloc.dart' as _i15;
import '../presentation/auth/register/bloc/register_bloc.dart' as _i17;
import '../presentation/getting_started/bloc/getting_started_cubit.dart'
    as _i10;
import '../presentation/home/bloc/home_bloc.dart' as _i11;
import '../presentation/splash/bloc/splash_bloc.dart' as _i19;

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
  gh.factory<_i7.CheckGettingStartedUseCase>(
      () => _i7.CheckGettingStartedUseCase(gh<_i8.SplashRepository>()));
  gh.lazySingleton<_i9.DioClientFactory>(() => _i9.DioClientFactory());
  gh.factory<_i10.GettingStartedCubit>(() => _i10.GettingStartedCubit());
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc());
  gh.lazySingleton<_i12.HomeRepository>(
      () => _i13.HomeRepositoryImpl(gh<_i3.ApiClientService>()));
  gh.lazySingleton<_i14.LocationClientService>(
      () => _i14.LocationClientService());
  gh.factory<_i15.LoginBloc>(() => _i15.LoginBloc());
  gh.lazySingleton<_i16.PlaceholderClientService>(
      () => _i16.PlaceholderClientService());
  gh.factory<_i17.RegisterBloc>(() => _i17.RegisterBloc());
  gh.factory<_i18.SaveSkipGettingStartedUseCase>(
      () => _i18.SaveSkipGettingStartedUseCase(gh<_i8.SplashRepository>()));
  gh.factory<_i19.SplashBloc>(() => _i19.SplashBloc());
  gh.factory<_i20.SplashRepositoryImpl>(
      () => _i20.SplashRepositoryImpl(gh<_i21.HiveClientPrimitiveFactory>()));
  gh.factory<_i22.HomeGetNewJobUseCase>(
      () => _i22.HomeGetNewJobUseCase(gh<_i12.HomeRepository>()));
  return getIt;
}
