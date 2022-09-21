import 'package:finances/domain/entities/movimentacao_entity.dart';

abstract class CadastrarMovimentacaoRepository {
  Future<bool> call(Movimentacao movimentacao);
}
