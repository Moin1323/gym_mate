import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static Color get background => Get.isDarkMode ? Colors.black : Colors.white;
  static Color get primary =>
      Get.isDarkMode ? const Color(0xFFA3EC3E) : const Color(0xFF4CAF50);
  static Color get secondary => Get.isDarkMode ? Colors.white : Colors.black;
}
