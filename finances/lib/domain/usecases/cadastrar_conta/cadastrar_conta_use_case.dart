import 'package:finances/domain/entities/conta_entity.dart';

abstract class CadastrarContaUseCase {
  Future<bool> call(Conta conta);
}
