import 'package:finances/domain/entities/conta_entity.dart';

abstract class CadastrarContaRepository {
  Future<bool> call(Conta conta);
}
