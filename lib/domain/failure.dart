import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class CredentialsMissingFailure extends Failure {
  const CredentialsMissingFailure(String message) : super(message);
}

class WrongCredentialsFailure extends Failure {
  const WrongCredentialsFailure(String message) : super(message);
}
