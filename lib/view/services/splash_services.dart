import 'dart:async';
import 'package:get/get.dart';
import 'package:gym_mate/res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(RoutesName.loginView),
    );
  }
}
