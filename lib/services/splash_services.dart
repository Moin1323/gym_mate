import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() {
    userPreferences.getUser().then(
      (value) {
        // If no token, navigate to login screen immediately
        if (value.token == null || value.token!.isEmpty) {
          Get.offNamed(RoutesName.loginView); // Navigate to login view
        } else {
          Get.offNamed(
              RoutesName.homeView); // Navigate to home view if logged in
        }
      },
    ).catchError((error) {
      // Handle error by redirecting to login view
      Get.offNamed(RoutesName.loginView);
    });
  }
}
