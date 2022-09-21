import 'conta_entity.dart';
import 'movimentacao_entity.dart';

class Cartao extends Conta {
  double saldo;
  List<Movimentacao> listaDeMovimentacao;
  DateTime criadoEm;
  Cartao({
    required this.saldo,
    required this.listaDeMovimentacao,
    required this.criadoEm,
  });
}
