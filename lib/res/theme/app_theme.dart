import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class AppThemes {
  // MY Theme
  static final ThemeData myTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.background, // Text color
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.withOpacity(0.3),
      filled: true,
      contentPadding: const EdgeInsets.all(15),
      hintStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: Colors.grey.withOpacity(.5)), // Color when enabled
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            const BorderSide(color: AppColors.primary), // Color when focused
      ),
    ),
  );

  // Method to set System UI Overlay Style
  static void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness:
          Brightness.dark, // Dark icons for light background
      statusBarColor: Colors.transparent, // Make the status bar transparent
    ));
  }
}
