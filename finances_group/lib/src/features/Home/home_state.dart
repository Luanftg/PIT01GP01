import 'package:finances_group/src/models/finantial_movement.dart';

abstract class HomeState {}

class HomeStateInitial implements HomeState {}

class HomeStateLoading implements HomeState {}

class HomeStateError implements HomeState {
  final String errorMessage;

  HomeStateError(this.errorMessage);
}

class HomeStateSucess implements HomeState {
  List<FinantialMovement> finantialMovementList;
  HomeStateSucess(this.finantialMovementList);
}

class HomeStateWelcome implements HomeState {
  List<FinantialMovement> finantialMovementList = [];
  HomeStateWelcome();
}
