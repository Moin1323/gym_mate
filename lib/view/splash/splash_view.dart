import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuthStatus(); // Navigate based on authentication status
  }

  void _navigateBasedOnAuthStatus() async {
    // Simulate a short delay to showcase the splash screen before navigating
    await Future.delayed(const Duration(seconds: 2));

    // Check if the user is logged in
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to the main dashboard
      Get.offNamed(
          RoutesName.bottomNavigationBar); // Adjust route name as necessary
    } else {
      // User is not logged in, navigate to the login view
      Get.offNamed(RoutesName.loginView);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
