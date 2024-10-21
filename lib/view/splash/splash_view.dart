import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    // Simulate a short delay to showcase the splash screen before navigating
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(RoutesName.loginView); // Navigate to login view
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
