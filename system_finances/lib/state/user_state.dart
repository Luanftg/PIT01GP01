import 'package:system_finances/models/user_model.dart';

abstract class UserState {}

class InitialUserState extends UserState {}

class SucessUserState extends UserState {
  final List<UserModel> users;
  SucessUserState(this.users);
}

class LoadindUserState extends UserState {}

class ErrorUserState extends UserState {
  final String message;
  ErrorUserState(this.message);
}
