import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

class CustomAppTextTheme {
  CustomAppTextTheme._();

  static TextStyle headline1 = const TextStyle(
      color: AppCustomColors.secondary,
      fontFamily: 'GoogleSans',
      fontSize: 31,
      fontWeight: FontWeight.bold);

  static TextStyle headline2 = const TextStyle(
      color: AppCustomColors.secondary,
      fontFamily: 'GoogleSans',
      fontSize: 24,
      fontWeight: FontWeight.bold);

  static TextStyle body = const TextStyle(
      color: AppCustomColors.white,
      fontFamily: 'GoogleSans',
      fontSize: 16,
      fontWeight: FontWeight.normal);

  static TextStyle button = const TextStyle(
      color: AppCustomColors.dark,
      fontFamily: 'GoogleSans',
      fontSize: 14,
      fontWeight: FontWeight.bold);

  static TextStyle caption = const TextStyle(
      color: AppCustomColors.grayLight,
      fontFamily: 'GoogleSans',
      fontSize: 12,
      fontWeight: FontWeight.normal);

   static TextStyle smallCaption = const TextStyle(
      color: AppCustomColors.grayLight,
      fontFamily: 'GoogleSans',
      fontSize: 10,
      fontWeight: FontWeight.normal);
}
