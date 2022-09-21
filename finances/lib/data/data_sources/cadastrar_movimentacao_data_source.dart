import 'package:finances/domain/entities/movimentacao_entity.dart';

abstract class CadastrarMovimentacaoDatasource {
  Future<bool> call(Movimentacao movimentacao);
}
