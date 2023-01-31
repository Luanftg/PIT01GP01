import 'dart:math';

import 'package:flutter/material.dart';

class Category {
  final String label;
  Color? color;
  final bool isIncome;
  final String? image;

  Category({
    required this.isIncome,
    this.image,
    this.color,
    required this.label,
  }) {
    color ??= gerarCor();
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'label': label});
    result.addAll({'isIncome': isIncome});

    if (image != null) {
      result.addAll({'image': image});
    }
    // if (color != null) {
    //   result.addAll({'color': color!.value.toString()});
    // }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      label: map['label'] ?? '',
      image: map['image'] ?? '',
      isIncome: map['isIncome'] ?? false,
      //color: Color(map['color']),
    );
  }
  Color gerarCor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
