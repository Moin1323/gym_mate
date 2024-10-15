import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

import 'widgets/AccountTile.dart'; // Ensure this file exists in your project

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.22,
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
                      'lib/assets/images/User_img3.jpg',
                      fit: BoxFit.cover,
                      width: Get.width * 0.25,
                      height: Get.height * 0.25,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.002),
                const Text(
                  'Josh Dor',
                  style: TextStyle(
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
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        '👑 Id: 1237',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
              height:
                  Get.height * 0.52, // Approximately 65% of the screen height
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  AccountTile(
                    accountName: 'Edit Profile',
                    leadingIcon: Icons.account_circle,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Password Change',
                    leadingIcon: Icons.lock_clock,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Subscription',
                    leadingIcon: Icons.subscriptions_rounded,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Saved Items',
                    leadingIcon: Icons.favorite,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Notifications',
                    leadingIcon: Icons.notifications,
                    showSwitch: true, // Show CupertinoSwitch for Notifications
                  ),
                  AccountTile(
                    accountName: 'Theme',
                    leadingIcon: Icons.color_lens_outlined,
                    showSwitch: true,
                  ),
                  AccountTile(
                    accountName: 'Privary & Security',
                    leadingIcon: Icons.privacy_tip,
                    trailingIcon: Icons.chevron_right,
                  ),
                  AccountTile(
                    accountName: 'Complains & Help',
                    leadingIcon: Icons.help,
                    trailingIcon: Icons.chevron_right,
                  ),
                  // Add more AccountTiles as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
