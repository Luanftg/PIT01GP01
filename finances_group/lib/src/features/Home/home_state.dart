import '../../models/user_model.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateError extends HomeState {
  final String errorMessage;

  HomeStateError(this.errorMessage);
}

class HomeStateSucess extends HomeState {
  final UserModel userLogged;
  HomeStateSucess(this.userLogged);
}

class HomeStateWelcome extends HomeState {
  final UserModel userLogged;
  HomeStateWelcome(this.userLogged);
}
