import 'package:finances/domain/entities/movimentacao_entity.dart';

abstract class CadastrarMovimentacaoUseCase {
  Future<bool> call(Movimentacao movimentacao);
}
