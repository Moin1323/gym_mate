import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  // Use an observable variable to store the current theme mode
  var themeMode = ThemeMode.dark.obs; // Set initial theme to dark

  // Function to toggle between light and dark themes
  void toggleTheme() {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
  }
}
