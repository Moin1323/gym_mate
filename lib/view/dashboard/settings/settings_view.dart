import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/auth/forgetPassword/forget_password_view.dart';
import 'package:gym_mate/view/auth/profile_/ProfileEditView.dart';
import 'package:gym_mate/view/dashboard/home/home_view.dart';
import 'package:gym_mate/view_models/controller/login/login_view_model.dart';
import 'widgets/AccountTile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final LoginViewModel loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.background,
    ));

    // Get current user information
    final user = loginVM.getCurrentUser();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.23,
            child: Image.asset(
              'lib/assets/images/user_cover_img.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 130,
            left: Get.width * 0.5 - 50,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'lib/assets/images/user_Logox.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.002),
                Text(
                  user?.displayName ?? 'User Name', // Fallback for no user
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary),
                ),
                SizedBox(height: Get.height * 0.002),
                Container(
                  width: Get.width * 0.25,
                  height: Get.height * 0.03,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        '👑 Id: 1237', // Replace with dynamic ID if available
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 335.0, left: 10, right: 10),
            child: SizedBox(
              height: Get.height * 0.52,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AccountTile(
                    accountName: 'Edit Profile',
                    leadingIcon: Icons.account_circle,
                    trailingIcon: Icons.chevron_right,
                    destinationScreen: ProfileEditView(),
                  ),
                  AccountTile(
                    accountName: 'Password Change',
                    leadingIcon: Icons.lock_clock,
                    trailingIcon: Icons.chevron_right,
                    destinationScreen: ForgotPasswordView(),
                  ),
                  const AccountTile(
                    accountName: 'Subscription',
                    leadingIcon: Icons.subscriptions_rounded,
                    trailingIcon: Icons.chevron_right,
                  ),
                  const AccountTile(
                    accountName: 'Saved Items',
                    leadingIcon: Icons.favorite,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Notifications',
                    leadingIcon: Icons.notifications,
                    showSwitch: true,
                  ),
                  const AccountTile(
                    accountName: 'Theme',
                    leadingIcon: Icons.color_lens_outlined,
                    showSwitch: true,
                  ),
                  AccountTile(
                    accountName: 'Log out',
                    leadingIcon: Icons.logout,
                    onPressed: () {
                      print("Logout pressed");
                      loginVM.logout(); // Call the logout function from the view model
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
