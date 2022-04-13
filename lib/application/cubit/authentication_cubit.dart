import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@Injectable()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final Dio _dio;
  final UserTokenRepository _userTokenRepository;

  AuthenticationCubit(this._dio, this._userTokenRepository)
      : super(AuthenticationUnauthenticated());

  void login(
      {required String username,
      required String password,
      required String apiKey}) async {
    print('trying to log in');
    final response = await _userTokenRepository.getUserToken(
        username: username, password: password, apiKey: apiKey);
    response.fold((failure) {
      _dio.options.headers['Authorization'] = null;
      emit(AuthenticationUnauthenticated());
    }, (userToken) {
      _dio.options.headers['Authorization'] = 'key $apiKey';
      emit(AuthenticationAuthenticated(userToken));
    });
  }
}
