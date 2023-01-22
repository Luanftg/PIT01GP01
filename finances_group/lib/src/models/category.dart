import 'dart:math';

import 'package:flutter/material.dart';

class Category {
  final String label;
  late final Color color;

  final String? image;

  Category({
    this.image,
    required this.label,
  }) {
    color = gerarCor();
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'label': label});

    if (image != null) {
      result.addAll({'image': image});
    }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      label: map['label'] ?? '',
      image: map['image'] ?? '',
    );
  }
  Color gerarCor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
