import 'dart:convert';

import 'package:finances_group/src/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class FinantialMovement {
  late String id;
  final String description;
  final double value;
  final String userID;
  final bool isIncome;
  final Category category;
  final String? paymentDate;

  FinantialMovement(
    this.id, {
    required this.description,
    required this.value,
    required this.userID,
    required this.isIncome,
    required this.category,
    this.paymentDate,
  }) {
    if (id == '') {
      id = uuid.v1();
    }
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'description': description});
    result.addAll({'value': value});
    result.addAll({'userID': userID});
    result.addAll({'isIncome': isIncome});
    result.addAll({'category': category.toMap()});
    if (paymentDate != null) {
      result.addAll({'paymentDate': paymentDate!});
    }

    return result;
  }

  factory FinantialMovement.fromMap(Map<String, dynamic> map) {
    return FinantialMovement(
      map['id'],
      description: map['description'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      userID: map['userID'] ?? '',
      isIncome: map['isIncome'] ?? false,
      category: Category.fromMap(map['category']),
      paymentDate: map['paymentDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FinantialMovement.fromJson(String source) =>
      FinantialMovement.fromMap(json.decode(source));
}
