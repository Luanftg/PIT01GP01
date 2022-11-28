abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateError extends HomeState {
  final String errorMessage;

  HomeStateError(this.errorMessage);
}

class HomeStateSucess extends HomeState {}
