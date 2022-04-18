part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() =
      AuthenticationStateUnauthenticated;
  const factory AuthenticationState.authenticated(String userToken) =
      AuthenticationStateAuthenticated;
}
