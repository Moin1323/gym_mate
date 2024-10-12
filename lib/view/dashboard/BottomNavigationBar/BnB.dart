import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/view/dashboard/home/widgets/Search.dart';
import 'package:gym_mate/view/search/search_filter/search_view/search_view.dart';
import 'package:iconsax/iconsax.dart';

import '../home/home_view.dart';

class Bnb extends StatefulWidget {
  const Bnb({super.key});

  @override
  State<Bnb> createState() => _BnbState();
}

class HomeController extends GetxController {
  var currentIndex = 0.obs; // Observable variable for current index

  // Method to change the index
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class _BnbState extends State<Bnb> {
  // Instantiate HomeController
  final HomeController homeController = Get.put(HomeController());

  // List of screens
  final List<Widget> _screens = [
    HomeView(), // HomeView screen
    SearchView(), // SearchView screen
    Search(), // SettingsView screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _screens[
            homeController.currentIndex.value]; // Display the selected screen
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
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
          currentIndex: homeController
              .currentIndex.value, // Current index from HomeController
          selectedItemColor: Color(0xFFA3EC3E), // Color for the selected item
          unselectedItemColor: Colors.white, // Color for unselected items
          backgroundColor: Color(
              0xFF000000), // Background color of the Bottom Navigation Bar
          onTap: (index) {
            homeController.changeIndex(index); // Change index when tapped
          },
          type: BottomNavigationBarType.fixed,
        );
      }),
    );
  }
}
