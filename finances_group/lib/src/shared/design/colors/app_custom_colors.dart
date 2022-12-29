import 'package:flutter/material.dart';

class AppCustomColors {
  AppCustomColors._();

  static const Color dark = Color(0xFF282A35);
  static const Color darkSecondary = Color(0xFF414558);
  static const Color primary = Color(0xFF8AFF80);
  static const Color secondary = Color(0xFF9580FF);
  static const Color danger = Color(0xFFFF9580);
  static const Color foreGround = Color(0xFFF8F8F2);
  static const Color grayLight = Color(0xFFA9A9AE);
  static const Color cyan = Color(0xFF80FFEA);
  static const Color grey = Colors.grey;

  static const Color divider = Color.fromARGB(131, 65, 69, 88);

  static const LinearGradient purpleCyan = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      secondary,
      cyan,
    ],
  );

  static const LinearGradient cyanGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      cyan,
      primary,
    ],
  );

  /*  static const Color secondary = Color.fromRGBO(13, 18, 56, 1);
  static const Color primary = Color.fromRGBO(63, 222, 174, 1);
  static const Color black = Color.fromRGBO(13, 16, 40, 1);
  static const Color white = Color.fromARGB(255, 230, 255, 247); */
}
