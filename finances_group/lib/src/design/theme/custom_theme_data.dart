import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/design/theme/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColorLight: AppCustomColors.primary,
  secondaryHeaderColor: AppCustomColors.secondary,
  bottomAppBarColor: AppCustomColors.primary,
  appBarTheme: const AppBarTheme(
    color: AppCustomColors.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppCustomColors.secondary,
  ),
  textTheme: TextTheme(
    caption: CustomAppTextTheme.caption,
  ),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
