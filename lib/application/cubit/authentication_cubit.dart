import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/user_token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

@Singleton()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final Dio _dio;
  final UserTokenRepositoryFacade _userTokenRepository;
  final SettingsCubit _settingsCubit;

  AuthenticationCubit(this._dio, this._userTokenRepository, this._settingsCubit)
      : super(const AuthenticationStateUnauthenticated());

  Future<Either<Failure, String>> login() async {
    final username = _settingsCubit.state.rebrickableUsername;
    final password = _settingsCubit.state.rebrickablePassword;
    final apiKey = _settingsCubit.state.rebrickableApiKey;

    if (username.isEmpty || password.isEmpty || apiKey.isEmpty) {
      emit(const AuthenticationStateUnauthenticated());
      return left(const CredentialsMissingFailure(
          'Please go to settings and enter your credentials for Rebrickable'));
    }

    final response = await _userTokenRepository.getUserToken(
        username: username, password: password, apiKey: apiKey);
    return response.fold((failure) {
      _dio.options.headers['Authorization'] = null;
      emit(const AuthenticationStateUnauthenticated());
      return left(failure);
    }, (userToken) {
      _dio.options.headers['Authorization'] = 'key $apiKey';
      emit(AuthenticationStateAuthenticated(userToken));
      return right(userToken);
    });
  }

  Future<Either<Failure, String>> get userToken async {
    if (state is! AuthenticationStateAuthenticated) {
      return login();
    }
    return right((state as AuthenticationStateAuthenticated).userToken);
  }
}
