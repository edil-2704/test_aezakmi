import 'package:flutter/material.dart';
import 'package:test_aezakmi/internal/constants/theme_helper/app_colors.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: AppColors.mainBlack,
    primary: AppColors.mainBlack,
    secondary: AppColors.mainBlack,
    tertiary: AppColors.mainWhite,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.mainBackground,
    selectedLabelStyle: TextStyle(color: AppColors.mainGreen),
    selectedIconTheme: IconThemeData(color: AppColors.mainGreen),
    selectedItemColor: AppColors.mainGreen,
  ),
  dialogBackgroundColor: AppColors.mainBackground,
  dialogTheme: const DialogTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: AppColors.mainBlack,
  iconTheme: const IconThemeData(color: AppColors.mainGreen),
  cardTheme: const CardTheme(color: AppColors.mainBlack),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.mainWhite),
  ),
);
