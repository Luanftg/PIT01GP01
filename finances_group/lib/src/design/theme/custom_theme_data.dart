import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/design/theme/text_theme.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';
import 'package:flutter/material.dart';

final ThemeData draculaTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
        background: AppCustomColors.dark,
        brightness: Brightness.dark,
        error: AppCustomColors.danger,
        onBackground: AppCustomColors.white,
        onError: AppCustomColors.white,
        onPrimary: AppCustomColors.dark,
        onSecondary: AppCustomColors.white,
        onSurface: AppCustomColors.white,
        primary: AppCustomColors.primary,
        secondary: AppCustomColors.secondary,
        surface: AppCustomColors.dark),

    // TEXT THEME
    textTheme: TextTheme(
      headline2: CustomAppTextTheme.headline2,
    ),
    scaffoldBackgroundColor: AppCustomColors.dark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppCustomColors.primary,
        foregroundColor: AppCustomColors.dark)
    /* primaryColorLight: AppCustomColors.primary,
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
  ), */
    );

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
