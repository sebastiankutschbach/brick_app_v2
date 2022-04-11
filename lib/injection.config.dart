// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/cubit/authentication_cubit.dart' as _i5;
import 'application/cubit/home_page_cubit.dart' as _i8;
import 'application/cubit/settings_cubit.dart' as _i7;
import 'infrastructure/rebrickable/set_list_repository.dart' as _i6;
import 'infrastructure/rebrickable/user_token_repository.dart' as _i4;
import 'injection.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.UserTokenRepository>(() => _i4.UserTokenRepository());
  gh.factory<_i5.AuthenticationCubit>(
      () => _i5.AuthenticationCubit(get<_i4.UserTokenRepository>()));
  gh.factory<_i6.SetListRepository>(() =>
      _i6.SetListRepository(get<_i3.Dio>(), get<_i5.AuthenticationCubit>()));
  gh.factory<_i7.SettingsCubit>(
      () => _i7.SettingsCubit(get<_i5.AuthenticationCubit>()));
  gh.factory<_i8.HomePageCubit>(
      () => _i8.HomePageCubit(get<_i6.SetListRepository>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
