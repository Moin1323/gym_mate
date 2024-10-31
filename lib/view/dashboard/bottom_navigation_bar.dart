import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/theme/app_theme.dart';
import 'package:gym_mate/view/dashboard/search/search_view.dart';
import 'package:gym_mate/view_models/controller/home_controller.dart';
import 'package:iconsax/iconsax.dart';

import 'settings/settings_view.dart';
import 'home/home_view.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  final UserController userController = Get.put(UserController());
  final HomeController homeController = Get.put(HomeController());

  // List of screens
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    userController.fetchUserData();
    userController.fetchAllExercises();
    userController.fetchAllEquipments();
    AppThemes.setStatusBarStyle();

    // Initialize _screens here
    _screens = [
      HomeView(userController: userController), // Pass the instance here
      SearchView(userController: userController),
      const SettingsView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screens[homeController.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting),
              label: '',
            ),
          ],
          currentIndex: homeController.currentIndex.value,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.secondary,
          backgroundColor: AppColors.background,
          onTap: (index) {
            homeController.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
