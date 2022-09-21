import 'conta_entity.dart';

class Usuario {
  String nome;
  String password;
  String caminhoDaFoto;
  List<Conta> listaDeConta;
  Usuario({
    required this.nome,
    required this.password,
    required this.caminhoDaFoto,
    required this.listaDeConta,
  });
}
