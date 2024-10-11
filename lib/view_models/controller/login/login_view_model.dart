import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/login_repository/login_repository.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/utils/utils.dart';
import 'package:gym_mate/view/dashboard/Exercieses/main_exercises_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository(); // Optional for any API-related login
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  // Main login method
  void loginApi() {
    signInWithEmailAndPassword();
  }

  // Firebase sign in with email and password
  Future<void> signInWithEmailAndPassword() async {
    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();
    loading.value = true;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _saveLoginStatus(true);
        clearFields();
        Get.offAll(() => MainExercisesView()); // Redirect to main view
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'Login failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        passwordController.value.clear(); // Clear only if there's an error
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        loading.value = false;
      }
    } else {
      Get.snackbar(
        'Error',
        'Please enter both email and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading.value = false;
    }
  }

  // Save login status in shared preferences
  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Clear input fields
  void clearFields() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  // Get current user from Firebase
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check if user is already logged in
  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn && getCurrentUser() != null) {
      Get.offAll(() => MainExercisesView());
    }
  }
}
