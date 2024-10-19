import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();

  void isLogin() async {
    try {
      // Retrieve user data from SharedPreferences
      var value = await userPreferences.getUser();

      // Debugging: Log the retrieved token
      print('Token in SplashServices: ${value.token}');

      // If no token, navigate to login screen
      if (value.token == null || value.token!.isEmpty) {
        print("No token found, navigating to login screen");
        Get.offNamed(RoutesName.loginView); // Navigate to login view
      } else {
        print("Token found, navigating to home screen");
        Get.offNamed(RoutesName.homeView); // Navigate to home view
      }
    } catch (error) {
      // Debugging: Log the error if token retrieval fails
      print('Error retrieving login status: $error');

      // Handle error by redirecting to login view
      Get.offNamed(RoutesName.loginView);
    }
  }
}
