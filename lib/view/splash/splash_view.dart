import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splash = SplashServices();

  @override
  void initState() {
    super.initState();
    splash.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
    );
  }
}
