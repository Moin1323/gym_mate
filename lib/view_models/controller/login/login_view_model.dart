import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/login_repository/login_repository.dart';
import 'package:gym_mate/view/dashboard/bottom_navigation_bar.dart';
import 'package:gym_mate/view_models/controller/home_controller.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository(); // Optional if you need to use a login API
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  RxBool loading = false.obs; // Loading state indicator

  // Main login method that calls Firebase sign in
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
        print("Attempting login with Email: $email");

        // Firebase Authentication sign in
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Login successful, User: ${userCredential.user?.email}");

        // Clear email and password fields after successful login
        clearFields();

        // Ensure HomeController is initialized before navigating
        if (!Get.isRegistered<HomeController>()) {
          Get.put(HomeController());
        }

        // Reset currentIndex to 0 (Home view)
        Get.find<HomeController>().changeIndex(0);

        // Navigate to the BottomNavigationBar (main dashboard)
        Get.offAll(() => const BottomNavigationbar());
      } on FirebaseAuthException catch (e) {
        // Firebase-specific error handling
        Get.snackbar(
          'Login Error',
          e.message ?? 'Login failed',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print("FirebaseAuthException: ${e.message}");

        // Clear only password on login error to avoid retyping email
        passwordController.clear();
      } catch (e) {
        // General error handling
        Get.snackbar(
          'Error',
          'Something went wrong. Please try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print("General Error during login: $e");
      } finally {
        loading.value = false; // Stop the loading indicator
      }
    } else {
      // Input validation error when fields are empty
      Get.snackbar(
        'Input Error',
        'Please enter both email and password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loading.value = false;
    }
  }

  // Clear email and password fields
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  // Get the current logged-in user from Firebase
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Logout functionality to sign out the user
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Firebase sign-out

      // Navigate back to the login screen after logging out
      Get.offAllNamed('/login_view'); // Adjust this to match your route name
    } catch (e) {
      // Handle logout errors
      Get.snackbar(
        'Logout Error',
        'Failed to log out. Please try again later.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Logout Error: $e");
    }
  }
}
