import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    try {
      // Every time the app starts, navigate directly to the login screen
      print("Navigating to login screen");
      Get.offNamed(RoutesName.loginView); // Navigate to login view
    } catch (error) {
      // Debugging: Log the error in case navigation fails
      print('Error navigating to login screen: $error');

      // In case of an error, still attempt to redirect to login view
      Get.offNamed(RoutesName.loginView);
    }
  }
}
