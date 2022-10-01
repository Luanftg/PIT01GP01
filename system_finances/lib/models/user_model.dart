import 'dart:convert';

class UserModel {
  final String userId;
  final String name;
  final String image;
  final List<Contas> accountList;
  UserModel({
    required this.userId,
    required this.name,
    required this.image,
    required this.accountList,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      image: json['image'],
      accountList: List<Contas>.from(
        json['listaDeConta'].map(
          (e) => Contas.fromMap(e),
        ),
      ),
    );
  }
}

class Contas {
  Bandeira bandeira;
  List<Movimentacao> listaDeMovimentacao;
  Contas({
    required this.bandeira,
    required this.listaDeMovimentacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bandeira': bandeira.toMap(),
      'listaDeMovimentacao': listaDeMovimentacao.map((x) => x.toMap()).toList(),
    };
  }

  factory Contas.fromMap(Map<String, dynamic> map) {
    return Contas(
      bandeira: Bandeira.fromMap(map['bandeira'] as Map<String, dynamic>),
      listaDeMovimentacao: List<Movimentacao>.from(
        (map['listaDeMovimentacao'] as List).map<Movimentacao>(
          (x) => Movimentacao.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Contas.fromJson(String source) =>
      Contas.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Movimentacao {
  String id;
  bool eReceita;
  String diaDeMovimentacao;
  double valor;
  String descricao;
  Movimentacao({
    required this.id,
    required this.eReceita,
    required this.diaDeMovimentacao,
    required this.valor,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'eReceita': eReceita,
      'diaDeMovimentacao': diaDeMovimentacao,
      'valor': valor,
      'descricao': descricao,
    };
  }

  factory Movimentacao.fromMap(Map<String, dynamic> map) {
    final movimentacao = Movimentacao(
      id: map['id'] as String,
      eReceita: map['ehReceita'] as bool,
      diaDeMovimentacao: map['diaDaMovimentacao'] as String,
      valor: map['valor'] as double,
      descricao: map['descricao'] as String,
    );
    return movimentacao;
  }

  String toJson() => json.encode(toMap());

  factory Movimentacao.fromJson(String source) =>
      Movimentacao.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Bandeira {
  String nome;
  String caminhoDaImagem;
  Bandeira({
    required this.nome,
    required this.caminhoDaImagem,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'imagem': caminhoDaImagem,
    };
  }

  factory Bandeira.fromMap(Map<String, dynamic> map) {
    return Bandeira(
      nome: map['nome'] as String,
      caminhoDaImagem: map['imagem'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bandeira.fromJson(String source) =>
      Bandeira.fromMap(json.decode(source) as Map<String, dynamic>);
}
