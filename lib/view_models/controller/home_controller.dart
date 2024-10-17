import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs; // Observable variable for current index

  // Method to change the index
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
