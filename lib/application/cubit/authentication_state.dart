part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String userToken;

  const AuthenticationAuthenticated(this.userToken);
}
