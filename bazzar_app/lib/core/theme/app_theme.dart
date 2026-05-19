import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.white,

    primaryColor: AppColors.primary500,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),

    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.h1,
      headlineMedium: AppTextStyles.h2,
      headlineSmall: AppTextStyles.h3,

      titleLarge: AppTextStyles.h4,
      titleMedium: AppTextStyles.h5,
      titleSmall: AppTextStyles.h6,

      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.primary500,
      secondary: AppColors.primary300,
      surface: AppColors.white,
      error: AppColors.red,
    ),
  );
}
