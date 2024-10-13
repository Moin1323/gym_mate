import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/view/search/search_filter/search_filter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/colors/app_colors.dart';

class Search_Conatiner extends StatefulWidget {
  const Search_Conatiner({super.key});

  @override
  State<Search_Conatiner> createState() => _Search_ConatinerState();
}

class _Search_ConatinerState extends State<Search_Conatiner> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Get.to(() => const SearchFilter());
        },
        child: Container(
          height: Get.height * 0.06875,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(27), // Rounded corners
            border: Border.all(
              color: Colors.grey,
              width: 1.0, // Border width
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_normal_1,
                color: AppColors.secondary,
              ),
              SizedBox(
                width: Get.width * 0.026,
              ),
              const Expanded(
                child: Text(
                  "Search workout..",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
