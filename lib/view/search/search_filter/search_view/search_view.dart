import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/search/search_filter/search_view/search_container.dart';

import 'new_equipment_component.dart';
import 'poadcast_controller.dart'; // Import the MyContainer widget

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
  int _currentPage = 0; // Track the current page

  // List of gun data
  final List<Map<String, String>> _gunsData = [
    {
      'imagePath': 'lib/assets/images/podcast_3.jpg',
      'heading': 'Unlock Endless\nMotivation With\nYour "Why"',
      'subheading': 'Podcast of the day',
    },
    {
      'imagePath': 'lib/assets/images/podcast_4.jpg',
      'heading': 'Unlock Endless\nMotivation With\nYour "Why"',
      'subheading': 'Podcast of the day',
    },
    {
      'imagePath': 'lib/assets/images/podcast_2.jpg',
      'heading': 'Unlock Endless\nMotivation With\nYour "Why"',
      'subheading': 'Podcast of the day',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Set background color
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.032,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    // Circular Avatar
                    // CircleAvatar(
                    //   radius: 25,
                    //   backgroundColor: Colors.red,
                    //   child: Image(
                    //     image: AssetImage('lib/assets/images/user_img.png'),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // use in future if needed ...................
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
              SizedBox(
                height: Get.height * 0.3375,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index; // Update current page index
                    });
                  },
                  itemCount: _gunsData.length, // Number of items in the list
                  itemBuilder: (context, index) {
                    final gun =
                        _gunsData[index]; // Get the data for the current page
                    return MyContainer(
                      imagePath: gun['imagePath']!,
                      title: gun['heading']!,
                      subTitle: gun['subheading']!,
                    );
                  },
                ),
              ),
              SizedBox(
                height: Get.height *
                    0.011, // 10 is approximately 1.25% of 800px height
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
              Container(
                height: Get.height * 0.3075,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageOverlayCard(
                      imagePath:
                          'lib/assets/images/gym_equ2.jpg', // Your image path
                      overlayText:
                          'Great Upper\n Chest comfort', // Overlay text
                      onBookmarkPressed: () {
                        // Handle bookmark action
                        print('Bookmark pressed');
                      },
                    ),
                    ImageOverlayCard(
                      imagePath:
                          'lib/assets/images/gym_equ1.jpg', // Your image path
                      overlayText:
                          'New Fiber\n All Size Dumbell', // Overlay text
                      onBookmarkPressed: () {
                        // Handle bookmark action
                        print('Bookmark pressed');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
