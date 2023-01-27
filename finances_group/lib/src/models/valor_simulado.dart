import 'dart:convert';

class ValorSimulado {
  double mounthValue;
  int month;
  double taxaAA;
  String userId;
  double initialValue;

  ValorSimulado({
    required this.initialValue,
    required this.mounthValue,
    required this.month,
    required this.taxaAA,
    required this.userId,
  });

  @override
  String toString() {
    return 'ValorSimulado(initialValue: $initialValue, mountValue: $mounthValue, month: $month, taxaAA: $taxaAA, userId: $userId)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'initialValue': initialValue});
    result.addAll({'mounthValue': mounthValue});
    result.addAll({'mounth': month});
    result.addAll({'taxaAA': taxaAA});
    result.addAll({'userId': userId});

    return result;
  }

  factory ValorSimulado.fromMap(Map<String, dynamic> map) {
    return ValorSimulado(
      initialValue: map['initialValue']?.toDouble() ?? 0.0,
      mounthValue: map['mounthValue']?.toDouble() ?? 0.0,
      month: map['mounth']?.toInt() ?? 0,
      taxaAA: map['taxaAA']?.toDouble() ?? 0.0,
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ValorSimulado.fromJson(String source) =>
      ValorSimulado.fromMap(json.decode(source));
}
