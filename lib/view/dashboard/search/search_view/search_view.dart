import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/dashboard/search/search_view/proadcast_video.dart';
import 'package:gym_mate/view/dashboard/search/search_view/search_container.dart';

import 'new_equipment_component.dart';

class SearchController extends GetxController {}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // Initialize GetX controller
  final PageController _pageController =
      PageController(); // PageController for PageView
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColors.background,
    ));
    return Scaffold(
      backgroundColor: AppColors.background, // Set background color
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Search_Conatiner(),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.018),
              const Row(
                children: [
                  Text(
                    'New Podcast',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.015),
              const VideoLoader(), // Video in the container
              SizedBox(
                height: Get.height *
                    0.022, // 10 is approximately 1.25% of 800px height
              ),
              Row(
                children: [
                  const Text(
                    "New Equipments",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageOverlayCard(
                    imagePath:
                        'lib/assets/images/gym_equ2.jpg', // Your image path
                    overlayText: 'Great Upper\n Chest comfort', // Overlay text
                    onBookmarkPressed: () {
                      // Handle bookmark action
                      print('Bookmark pressed');
                    },
                  ),
                  ImageOverlayCard(
                    imagePath:
                        'lib/assets/images/gym_equ1.jpg', // Your image path
                    overlayText: 'New Fiber\n All Size Dumbell', // Overlay text
                    onBookmarkPressed: () {
                      // Handle bookmark action
                      print('Bookmark pressed');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
