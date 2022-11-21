import 'package:flutter/material.dart';

import 'package:finances_group/src/models/finantial_movement.dart';

class DataItem {
  final double value;
  final String label;
  final Color color;
  DataItem({
    required this.value,
    required this.label,
    required this.color,
  });

  factory DataItem.fromFinantialMovement(FinantialMovement fm) {
    return DataItem(
        value: fm.value, label: fm.category.label, color: fm.category.color);
  }

  @override
  String toString() => 'DataItem(value: $value, label: $label, color: $color)';
}
