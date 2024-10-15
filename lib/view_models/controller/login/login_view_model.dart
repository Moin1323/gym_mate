import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/login_repository/login_repository.dart';
import 'package:gym_mate/view/dashboard/bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository(); // Optional for any API-related login
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus(); // Check login status on initialization
  }

  // Main login method
  void loginApi() {
    signInWithEmailAndPassword();
  }

  // Firebase sign in with email and password
  Future<void> signInWithEmailAndPassword() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    loading.value = true;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _saveLoginStatus(true);
        clearFields();
        Get.offAll(() => const BottomNavigationbar()); // Redirect to main view
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Login Error',
          e.message ?? 'Login failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        passwordController.clear(); // Clear only if there's an error
      } catch (e) {
        Get.snackbar(
          'Error',
          'Something went wrong. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        loading.value = false;
      }
    } else {
      Get.snackbar(
        'Input Error',
        'Please enter both email and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading.value = false;
    }
  }

  // Save login status in shared preferences
  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', isLoggedIn);
    } catch (e) {
      Get.snackbar(
        'Preferences Error',
        'Failed to save login status',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Clear input fields
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  // Get current user from Firebase
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (isLoggedIn && getCurrentUser() != null) {
        Get.offAll(() => const BottomNavigationbar());
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to check login status',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
