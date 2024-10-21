import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/colors/app_colors.dart';

// Define the SearchController here
class SearchController extends GetxController {
  var searchText = ''.obs;

  void updateSearchText(String value) {
    searchText.value = value; // Updates search text
  }
}

class SearchTextfeild extends StatefulWidget {
  const SearchTextfeild({super.key});

  @override
  State<SearchTextfeild> createState() => _SearchTextfeildState();
}

class _SearchTextfeildState extends State<SearchTextfeild> {
  final SearchController controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.updateSearchText(value); // Update search text
      },
      style: TextStyle(color: AppColors.secondary), // Set text color to white
      decoration: InputDecoration(
        hintText: "Search workout..",
        hintStyle: const TextStyle(color: Colors.grey), // Hint text color
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27), // Rounded corners
          borderSide:
              const BorderSide(color: Colors.grey), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(27), // Rounded corners when focused
          borderSide:
              BorderSide(color: AppColors.primary), // Border color when focused
        ),
        prefixIcon: Icon(
          Iconsax.search_normal_1,
          color: AppColors.secondary, // Place icon at the start
        ),
        filled: true,
        fillColor: AppColors.background, // Set background color
      ),
    );
  }
}
