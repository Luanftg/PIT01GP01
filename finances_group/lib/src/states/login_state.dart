abstract class LoginState {}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSucces extends LoginState {}

class LoginStateError extends LoginState {
  final String error;
  LoginStateError(this.error);
}
