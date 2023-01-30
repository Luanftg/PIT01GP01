import '../../models/valor_simulado.dart';

abstract class SimulatorState {}

class SimulatorSucessState extends SimulatorState {
  final ValorSimulado valorSimulado;
  SimulatorSucessState(this.valorSimulado);
}

class SimulatorErrorState extends SimulatorState {
  final String message;
  SimulatorErrorState(this.message);
}

class SimulatorLoadingState extends SimulatorState {}

class SimulatorInitialState extends SimulatorState {}
