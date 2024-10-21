import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class BestProgramsSectionWidget extends StatelessWidget {
  const BestProgramsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Best Programs 🔥",
              style: TextStyle(
                  color: AppColors.secondary, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Container(
          height: Get.height * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.secondary.withOpacity(0.2),
          ),
          // You can add dynamic content here for the best programs
        ),
      ],
    );
  }
}
