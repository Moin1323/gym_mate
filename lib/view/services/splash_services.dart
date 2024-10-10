import 'dart:async';
import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then(
      (value) {
        // Check if token is null or empty, and navigate accordingly
        if (value.token == null || value.token!.isEmpty) {
          // No user data exists, navigate to login screen
          Timer(
            const Duration(seconds: 3),
            () => Get.offNamed(RoutesName
                .loginView), // Use Get.offNamed to prevent back navigation
          );
        } else {
          // User is logged in, navigate to home screen
          Timer(
            const Duration(seconds: 3),
            () => Get.offNamed(RoutesName.homeView),
          );
        }
      },
    ).catchError((error) {
      // Handle any errors (e.g., if fetching user data fails)
      Timer(
        const Duration(seconds: 3),
        () => Get.offNamed(RoutesName.loginView), // Fallback to login on error
      );
    });
  }
}
