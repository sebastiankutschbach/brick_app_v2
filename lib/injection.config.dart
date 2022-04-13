// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/cubit/authentication_cubit.dart' as _i7;
import 'application/cubit/home_page_cubit.dart' as _i8;
import 'application/cubit/set_list_page_cubit.dart' as _i9;
import 'application/cubit/settings_cubit.dart' as _i5;
import 'infrastructure/rebrickable/set_list_repository.dart' as _i4;
import 'infrastructure/rebrickable/user_token_repository.dart' as _i6;
import 'injection.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.factory<_i4.SetListRepository>(
      () => _i4.SetListRepository(get<_i3.Dio>()));
  gh.factory<_i5.SettingsCubit>(() => _i5.SettingsCubit());
  gh.factory<_i6.UserTokenRepository>(() => _i6.UserTokenRepository());
  gh.factory<_i7.AuthenticationCubit>(() => _i7.AuthenticationCubit(
      get<_i3.Dio>(),
      get<_i6.UserTokenRepository>(),
      get<_i5.SettingsCubit>()));
  gh.factory<_i8.HomePageCubit>(() => _i8.HomePageCubit(
      get<_i4.SetListRepository>(), get<_i7.AuthenticationCubit>()));
  gh.factory<_i9.SetListPageCubit>(() => _i9.SetListPageCubit(
      get<_i4.SetListRepository>(), get<_i7.AuthenticationCubit>()));
  return get;
}

class _$DioModule extends _i10.DioModule {}
