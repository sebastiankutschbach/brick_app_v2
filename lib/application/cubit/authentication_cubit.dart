import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/application/cubit/settings_cubit.dart';
import 'package:brick_app_v2/domain/failure.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@Injectable()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final Dio _dio;
  final UserTokenRepository _userTokenRepository;
  final SettingsCubit _settingsCubit;

  AuthenticationCubit(this._dio, this._userTokenRepository, this._settingsCubit)
      : super(AuthenticationUnauthenticated());

  Future<Either<Failure, String>> login() async {
    final username = _settingsCubit.state.rebrickableUsername;
    final password = _settingsCubit.state.rebrickablePassword;
    final apiKey = _settingsCubit.state.rebrickableApiKey;

    final response = await _userTokenRepository.getUserToken(
        username: username, password: password, apiKey: apiKey);
    return response.fold((failure) {
      _dio.options.headers['Authorization'] = null;
      emit(AuthenticationUnauthenticated());
      return left(failure);
    }, (userToken) {
      _dio.options.headers['Authorization'] = 'key $apiKey';
      emit(AuthenticationAuthenticated(userToken));
      return right(userToken);
    });
  }

  Future<Either<Failure, String>> get userToken async {
    if (state is! AuthenticationAuthenticated) {
      return login();
    }
    return right((state as AuthenticationAuthenticated).userToken);
  }
}
