import 'conta_entity.dart';
import 'empresa_entity.dart';

class Movimentacao {
  String id;
  bool ehReceita;
  DateTime diaDePagamento;
  Conta tipoDeMovimentacao;
  double valor;
  Empresa empresa;
  DateTime criadoEm;
  DateTime atualizaEm;
  Enum categoria;
  Movimentacao({
    required this.empresa,
    required this.id,
    required this.ehReceita,
    required this.diaDePagamento,
    required this.tipoDeMovimentacao,
    required this.valor,
    required this.criadoEm,
    required this.atualizaEm,
    required this.categoria,
  });
}
