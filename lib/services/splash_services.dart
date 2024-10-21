import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashServices {
  void navigateToAppropriateView() {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // User is logged in, navigate to the main dashboard
        Get.offNamed(
            RoutesName.bottomNavigationBar); // Adjust route name as necessary
      } else {
        // User is not logged in, navigate to the login view
        Get.offNamed(RoutesName.loginView);
      }
    } catch (error) {
      // Log the error in case navigation fails
      print('Error navigating to the appropriate view: $error');

      // Attempt to redirect to the login view if an error occurs
      Get.offNamed(RoutesName.loginView);
    }
  }
}
