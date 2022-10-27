import 'package:finances_group/src/design/colors/app_custom_colors.dart';
import 'package:finances_group/src/design/theme/text_theme.dart';
import 'package:finances_group/src/view/widgets/homepage/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData draculaTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
      background: AppCustomColors.dark,
      brightness: Brightness.dark,
      error: AppCustomColors.danger,
      onBackground: AppCustomColors.foreGround,
      onError: AppCustomColors.foreGround,
      onPrimary: AppCustomColors.dark,
      onSecondary: AppCustomColors.foreGround,
      onSurface: AppCustomColors.foreGround,
      primary: AppCustomColors.primary,
      secondary: AppCustomColors.secondary,
      surface: AppCustomColors.dark),
  fontFamily: GoogleFonts.sourceSansPro().fontFamily,
  scaffoldBackgroundColor: AppCustomColors.dark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppCustomColors.primary,
      foregroundColor: AppCustomColors.dark),
  cardTheme: const CardTheme(color: AppCustomColors.darkSecondary),
);

ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
