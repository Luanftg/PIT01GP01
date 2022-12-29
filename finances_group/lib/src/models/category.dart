import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  final String label;
  final Color color;
  final String? image;

  Category({
    this.image,
    required this.label,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'label': label});
    result.addAll({'color': color.value});
    if (image != null) {
      result.addAll({'image': image});
    }

    return result;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      label: map['label'] ?? '',
      color: Color(map['color']),
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() =>
      'Category(label: $label, color: $color, image: $image??' ')';
}