import 'package:finances_group/src/view/design/colors/app_custom_colors.dart';
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
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppCustomColors.dark,
  ),
  dividerColor: AppCustomColors.divider,
  listTileTheme: const ListTileThemeData(
    iconColor: AppCustomColors.secondary,
  ),
  dividerTheme: const DividerThemeData(color: AppCustomColors.divider),
);

ThemeData draculaLightTheme = ThemeData(brightness: Brightness.light);
