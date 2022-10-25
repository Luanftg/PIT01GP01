import 'package:flutter/material.dart';

class CustomAppTextTheme {
  CustomAppTextTheme._();

  static TextStyle caption =
      const TextStyle(fontFamily: 'GoogleSans', fontSize: 20);

  static TextStyle headline3 = const TextStyle(
      fontFamily: 'GoogleSans', fontSize: 18, fontWeight: FontWeight.normal);

  static TextStyle headline4 = const TextStyle(
      fontFamily: 'GoogleSans', fontSize: 28, fontWeight: FontWeight.bold);

  static TextStyle headline6 = const TextStyle(
      fontFamily: 'GoogleSans', fontSize: 22, fontWeight: FontWeight.bold);

  static TextStyle label = const TextStyle(
      fontFamily: 'GoogleSans', fontSize: 12, fontStyle: FontStyle.italic);
}
