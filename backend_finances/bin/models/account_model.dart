import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountModel {
  final int id;
  final String name;
  final String imagem;
  double balance;
  AccountModel({
    required this.id,
    required this.name,
    required this.imagem,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagem': imagem,
      'balance': balance,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as int,
      name: map['name'] as String,
      imagem: map['imagem'] as String,
      balance: map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, imagem: $imagem, balance: $balance)';
  }
}
