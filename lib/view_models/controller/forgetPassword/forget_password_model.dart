import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';
import 'package:gym_mate/view/dashboard/bottom_navigation_bar.dart';

class ResetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Method to reset password
  Future<void> resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your email",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      isLoading.value = false;
      Get.snackbar(
        "Reset Password",
        "Password reset email has been sent",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
      // Check if user is logged in after reset
      if (_auth.currentUser != null) {
        // Navigate to home if logged in
        Get.offAll(() => const BottomNavigationbar());
      } else {
        // If not logged in, navigate to login page
        Get.offAll(() => const LoginView());
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.message ?? "An error occurred",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
