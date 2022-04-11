import 'package:bloc/bloc.dart';
import 'package:brick_app_v2/infrastructure/rebrickable/user_token_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'authentication_state.dart';

@Injectable()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserTokenRepository _userTokenRepository;

  AuthenticationCubit(this._userTokenRepository)
      : super(AuthenticationInitial());

  void login({required String username, required String password}) async {
    final response = await _userTokenRepository.getUserToken(
        username: username, password: password);
    response.fold((failure) => emit(AuthenticationUnauthenticated()),
        (userToken) {
      emit(AuthenticationAuthenticated(userToken));
    });
  }
}
