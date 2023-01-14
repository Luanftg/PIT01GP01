import 'package:finances_group/src/shared/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomAppTextTheme {
  CustomAppTextTheme._();

  static TextStyle headline1 = const TextStyle(
      color: AppCustomColors.secondary,
      fontSize: 28,
      fontWeight: FontWeight.bold);

  static TextStyle largeCaption = const TextStyle(
      color: AppCustomColors.foreGround,
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static TextStyle headline2 = const TextStyle(
    color: AppCustomColors.secondary,
    fontSize: 24,
  );

  static TextStyle body = const TextStyle(
      color: AppCustomColors.foreGround,
      fontSize: 16,
      fontWeight: FontWeight.normal);

  static TextStyle button = const TextStyle(
    color: AppCustomColors.dark,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackCaption = const TextStyle(
    color: AppCustomColors.dark,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle label = const TextStyle(
    color: AppCustomColors.grayLight,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle caption = const TextStyle(
      color: AppCustomColors.grayLight,
      fontSize: 12,
      fontWeight: FontWeight.normal);

  static TextStyle smallCaption = const TextStyle(
      color: AppCustomColors.grayLight,
      fontSize: 10,
      fontWeight: FontWeight.normal);
}
