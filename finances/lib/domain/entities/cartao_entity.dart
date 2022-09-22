import 'package:finances/domain/entities/bandeira_entity.dart';

import 'conta_entity.dart';
import 'movimentacao_entity.dart';

class Cartao extends Conta {
  double saldo;
  late List<Movimentacao> listaDeMovimentacao;
  DateTime? criadoEm;
  Bandeira bandeira;

  Cartao({required this.saldo, required this.bandeira}) {
    criadoEm = DateTime.now();
    listaDeMovimentacao = [];
  }
}
