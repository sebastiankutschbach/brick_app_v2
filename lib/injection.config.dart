// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/cubit/authentication_cubit.dart' as _i9;
import 'application/cubit/home_page_cubit.dart' as _i11;
import 'application/cubit/moc_list_page_cubit.dart' as _i12;
import 'application/cubit/pdf_page_cubit.dart' as _i5;
import 'application/cubit/set_list_page_cubit.dart' as _i13;
import 'application/cubit/settings_cubit.dart' as _i7;
import 'infrastructure/brick_set_repository.dart' as _i10;
import 'infrastructure/moc_repository.dart' as _i4;
import 'infrastructure/set_list_repository.dart' as _i6;
import 'infrastructure/user_token_repository.dart' as _i8;
import 'injection.dart' as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i7.SettingsCubit>(_i7.SettingsCubit());
  gh.factory<_i8.UserTokenRepositoryFacade>(() => _i8.UserTokenRepository());
  gh.singleton<_i9.AuthenticationCubit>(_i9.AuthenticationCubit(get<_i3.Dio>(),
      get<_i8.UserTokenRepositoryFacade>(), get<_i7.SettingsCubit>()));
  gh.factory<_i10.BrickSetRepositoryFacade>(
      () => _i10.BrickSetRepository(get<_i3.Dio>()));
  gh.factory<_i11.HomePageCubit>(() => _i11.HomePageCubit(
      get<_i6.SetListRepositoryFacade>(), get<_i9.AuthenticationCubit>()));
  gh.factory<_i12.MocListPageCubit>(() => _i12.MocListPageCubit(
      get<_i10.BrickSetRepositoryFacade>(), get<_i4.MocRepositoryFacade>()));
  gh.factory<_i13.SetListPageCubit>(() => _i13.SetListPageCubit(
      get<_i6.SetListRepositoryFacade>(), get<_i9.AuthenticationCubit>()));
  return get;
}

class _$DioModule extends _i14.DioModule {}
