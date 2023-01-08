import 'package:finances_group/src/models/user_model.dart';

abstract class SplashState {}

class UserLogedSplashState implements SplashState {
  final UserModel userLogged;

  UserLogedSplashState(this.userLogged);
}

class UserUnLogedSplashState implements SplashState {}

class SplashStateError implements SplashState {
  final String message;
  SplashStateError({
    required this.message,
  });
}

class LoadingSplashState implements SplashState {}

class InitialSplashState implements SplashState {}
