import 'package:finances_group/src/models/user_model.dart';

abstract class LoginState {}

class LoginStateInit extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSucces extends LoginState {
  final UserModel userLogged;

  LoginStateSucces(this.userLogged);
}

class LoginStateError extends LoginState {
  final String error;
  LoginStateError(this.error);
}
