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
    as _i13;

import '../core/network/dio_client_factory.dart' as _i7;
import '../core/storage/local_storage.dart' as _i12;
import '../data/data_source/remote/api_client_service.dart' as _i3;
import '../data/data_source/remote/placeholder_client_service.dart' as _i15;
import '../data/repository_impls/auth_repository_impl.dart' as _i6;
import '../data/repository_impls/home_repository_impl.dart' as _i11;
import '../data/repository_impls/splash_repository_impl.dart' as _i18;
import '../domain/domain.dart' as _i5;
import '../domain/repositories/home_repository.dart' as _i10;
import '../domain/usecases/home_get_new_job_usecase.dart' as _i19;
import '../presentation/auth/bloc/auth_bloc.dart' as _i4;
import '../presentation/auth/login/bloc/login_bloc.dart' as _i14;
import '../presentation/auth/register/bloc/register_bloc.dart' as _i16;
import '../presentation/getting_started/bloc/getting_started_cubit.dart' as _i8;
import '../presentation/home/bloc/home_bloc.dart' as _i9;
import '../presentation/splash/bloc/splash_bloc.dart' as _i17;

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
  gh.factory<_i12.LocalStorage>(
      () => _i12.LocalStorage(gh<_i13.HiveClientPrimitiveFactory>()));
  gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc());
  gh.lazySingleton<_i15.PlaceholderClientService>(
      () => _i15.PlaceholderClientService());
  gh.factory<_i16.RegisterBloc>(() => _i16.RegisterBloc());
  gh.factory<_i17.SplashBloc>(() => _i17.SplashBloc());
  gh.factory<_i18.SplashRepositoryImpl>(
      () => _i18.SplashRepositoryImpl(gh<_i13.HiveClientPrimitiveFactory>()));
  gh.factory<_i19.HomeGetNewJobUseCase>(
      () => _i19.HomeGetNewJobUseCase(gh<_i10.HomeRepository>()));
  return getIt;
}
