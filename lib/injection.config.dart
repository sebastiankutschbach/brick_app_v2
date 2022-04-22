// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/cubit/authentication_cubit.dart' as _i10;
import 'application/cubit/home_page_cubit.dart' as _i12;
import 'application/cubit/moc_list_page_cubit.dart' as _i13;
import 'application/cubit/pdf_page_cubit.dart' as _i5;
import 'application/cubit/set_list_page_cubit.dart' as _i14;
import 'application/cubit/settings_cubit.dart' as _i8;
import 'infrastructure/brick_set_repository.dart' as _i11;
import 'infrastructure/moc_repository.dart' as _i4;
import 'infrastructure/set_list_repository.dart' as _i6;
import 'infrastructure/set_repository.dart' as _i7;
import 'infrastructure/user_token_repository.dart' as _i9;
import 'injection.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.factory<_i4.MocRepositoryFacade>(() => _i4.MocRepository(get<_i3.Dio>()));
  gh.factory<_i5.PdfPageCubit>(
      () => _i5.PdfPageCubit(get<_i4.MocRepositoryFacade>()));
  gh.factory<_i6.SetListRepositoryFacade>(
      () => _i6.SetListRepository(get<_i3.Dio>()));
  gh.factory<_i7.SetRepositoryFacade>(() => _i7.SetRepository(get<_i3.Dio>()));
  gh.singleton<_i8.SettingsCubit>(_i8.SettingsCubit());
  gh.factory<_i9.UserTokenRepositoryFacade>(() => _i9.UserTokenRepository());
  gh.singleton<_i10.AuthenticationCubit>(_i10.AuthenticationCubit(
      get<_i3.Dio>(),
      get<_i9.UserTokenRepositoryFacade>(),
      get<_i8.SettingsCubit>()));
  gh.factory<_i11.BrickSetRepositoryFacade>(
      () => _i11.BrickSetRepository(get<_i3.Dio>()));
  gh.factory<_i12.HomePageCubit>(() => _i12.HomePageCubit(
      get<_i6.SetListRepositoryFacade>(), get<_i10.AuthenticationCubit>()));
  gh.factory<_i13.MocListPageCubit>(() => _i13.MocListPageCubit(
      get<_i11.BrickSetRepositoryFacade>(), get<_i4.MocRepositoryFacade>()));
  gh.factory<_i14.SetListPageCubit>(() => _i14.SetListPageCubit(
      get<_i6.SetListRepositoryFacade>(), get<_i10.AuthenticationCubit>()));
  return get;
}

class _$DioModule extends _i15.DioModule {}
