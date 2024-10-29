import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Notifications/notifications_view.dart';

class HeaderWidget extends StatelessWidget {
  final UserController userController;

  const HeaderWidget({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          Obx(() {
            if (userController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              String userName = userController.user.value.name ?? 'User';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $userName 💪🏻',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    'Fitness Freaks.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              );
            }
          }),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(const NotificationsView());
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.secondary.withOpacity(0.2),
              child: Icon(
                Iconsax.notification,
                size: 20,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
