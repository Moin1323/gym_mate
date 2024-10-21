import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
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
  final HomeController homeController = Get.put(HomeController());

  final List<Widget> _screens = [
    const HomeView(),
    const SearchView(),
    const SettingsView(),
  ];

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
            print("Current Index: $index"); // Debugging line
            homeController.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
