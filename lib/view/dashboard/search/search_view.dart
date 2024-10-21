import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/dashboard/search/widgets/new_equipments.dart';
import 'package:gym_mate/view/dashboard/search/widgets/podcast.dart';
import 'package:gym_mate/view/dashboard/search/widgets/search_container.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize UserController
    final UserController userController = Get.put(UserController());

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
              Row(
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
                height:
                    Get.height * 0.022, // Approximately 1.25% of 800px height
              ),
              Obx(() {
                // Use Obx to reactively build the widget based on loading state
                return NewEquipments(
                  equipments: userController.equipments,
                  isLoading: userController
                      .isLoading.value, // Pass the isLoading parameter
                  title:
                      'Latest Equipments', // Provide a title for the NewEquipments
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
