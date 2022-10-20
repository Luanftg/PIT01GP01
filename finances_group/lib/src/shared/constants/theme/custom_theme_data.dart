import 'package:finances_group/src/shared/constants/colors/app_custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColorLight: AppCustomColors.primary,
  secondaryHeaderColor: AppCustomColors.secondary,
  bottomAppBarColor: AppCustomColors.primary,
  appBarTheme: const AppBarTheme(color: AppCustomColors.primary),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppCustomColors.secondary),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
