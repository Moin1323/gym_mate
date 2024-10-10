import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabController extends GetxController {
  var selectedIndex = 0.obs; // Observable variable for the selected index
  late TabController tabController; // Declare the TabController

  // Initialize the TabController in a method
  void initTabController(TickerProvider vsync, int length) {
    tabController = TabController(length: length, vsync: vsync);
  }

  void changeTab(int index) {
    selectedIndex.value = index; // Update the selected index
    tabController.index = index; // Change the TabController's index
  }

  @override
  void onClose() {
    tabController.dispose(); // Dispose of the TabController when done
    super.onClose();
  }
}
