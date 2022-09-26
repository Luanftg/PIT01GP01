import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle caption = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 9.0,
    color: AppColors.caption,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 41.0,
    color: AppColors.grey,
  );
  static const TextStyle profileData = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: AppColors.grey,
  );
}
