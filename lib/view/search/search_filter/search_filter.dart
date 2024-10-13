import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/search/search_filter/popular_searches.dart';
import 'package:gym_mate/view/search/search_filter/search_textfeild.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Set background color
      appBar: AppBar(
        title: const SearchTextfeild(),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: AppColors.secondary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.075,
                ),
                const WorkoutTag(
                  title: 'Burn Belly Fat',
                  emoji: '🔥',
                ),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                const WorkoutTag(
                  title: 'Biseps Tutorials',
                  emoji: '💪',
                  width: 140,
                ),
              ],
            ),
            SizedBox(
              height: Get.height *
                  0.020, // 10 is approximately 2.5% of a 400px screen height
            ),
            Row(
              children: [
                const WorkoutTag(
                  title: 'Leg Workout',
                  emoji: '🏋️',
                  width: 120,
                ),
                SizedBox(
                  width: Get.width *
                      0.0125, // Adjusting 5px to a percentage of the screen width
                ),
                const WorkoutTag(
                  title: 'Boxing',
                  emoji: '🥊',
                  width: 100,
                ),
                SizedBox(
                  width: Get.width *
                      0.0125, // Adjusting 5px to a percentage of the screen width
                ),
                const WorkoutTag(
                  title: 'Treadmil',
                  emoji: '🏃',
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
