import 'dart:convert';

import 'package:finances_group/src/models/category.dart';

class FinantialMovement {
  final int? id;
  final String description;
  final double value;
  final int userID;
  final bool isIncome;
  final Category category;
  final DateTime? paymentDate;

  FinantialMovement({
    this.paymentDate,
    this.id,
    required this.category,
    required this.description,
    required this.value,
    required this.userID,
    required this.isIncome,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'description': description});
    result.addAll({'value': value});
    result.addAll({'userID': userID});
    result.addAll({'isIncome': isIncome});
    result.addAll({'category': category.toMap()});
    result.addAll({'paymentDate': paymentDate});

    return result;
  }

  factory FinantialMovement.fromMap(Map<String, dynamic> map) {
    return FinantialMovement(
        id: map['id']?.toInt(),
        description: map['description'] ?? '',
        value: map['value']?.toDouble() ?? 0.0,
        userID: map['userID']?.toInt() ?? 0,
        isIncome: map['isIncome'] ?? false,
        category: Category.fromMap(map['category']),
        paymentDate: map['paymentDate'] ?? DateTime.now());
  }

  String toJson() => json.encode(toMap());

  factory FinantialMovement.fromJson(String source) =>
      FinantialMovement.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FinantialMovement(id: $id, description: $description, value: $value, userID: $userID, isIncome: $isIncome, category: $category, paymentDate: $paymentDate)';
  }
}
