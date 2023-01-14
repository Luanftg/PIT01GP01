import 'package:finances_group/src/models/user_model.dart';

abstract class HomeState {}

class HomeStateInitial implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateError implements HomeState {
  final String errorMessage;

  HomeStateError(this.errorMessage);
}

class HomeStateSucess implements HomeState {
  final UserModel userLogged;
  HomeStateSucess(this.userLogged);
}

class HomeStateWelcome implements HomeState {
  final UserModel userLogged;
  HomeStateWelcome(this.userLogged);
}
