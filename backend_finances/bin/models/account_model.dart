import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountModel {
  final int? id;
  final String name;
  final String imagem;
  double balance;

  AccountModel(
    this.id,
    this.name,
    this.imagem,
    this.balance,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagem': imagem,
      'balance': balance,
    };
  }

  factory AccountModel.fromJson(Map map) {
    return AccountModel(
      map['id'] ?? '',
      map['name'] as String,
      map['imagem'] as String,
      map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AccountModel(id: $id, name: $name, imagem: $imagem, balance: $balance)';
  }
}
