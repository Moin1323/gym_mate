import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:iconsax/iconsax.dart';

import '../../../res/colors/app_colors.dart';
import '../../../services/notifications_service.dart';
import '../../Notifications/notifications_view.dart';
import 'widgets/exercise_component.dart';
import 'widgets/tb_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final UserController userController = Get.put(UserController());
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    userController.fetchUserData();
    userController.fetchAllExercises();
    notificationServices.requestNotificationPermission();
    notificationServices.initLocalNotifications(
        context, RemoteMessage()); // Initialize local notifications
    notificationServices.firebaseInit();
    notificationServices.getDeviceToken().then((value) {
      print('Device token: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.020),
              // Header Section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Obx(() {
                      if (userController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        String userName =
                            userController.user.value.name ?? 'User';
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, $userName 💪🏻',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            const Text(
                              'This Is Gym Mate',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(notifications_view());
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Iconsax.notification,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              // Banner/Info Section
              Container(
                height: Get.height * 0.14,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              // TabBar Section
              const TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.primary,
                tabs: [
                  // First Tab with Image and Text
                  TabrComponent(
                    label: 'Cardio',
                    imageAsset: 'lib/assets/images/cardio2.png',
                  ),
                  // Second Tab with Image and Text
                  TabrComponent(
                    label: 'Gym',
                    imageAsset: 'lib/assets/images/dumbbell.png',
                  ),
                  // Third Tab with Image and Text
                  TabrComponent(
                    label: 'Boxing',
                    imageAsset: 'lib/assets/images/boxing.png',
                  ),
                ],
              ),
              Expanded(
                child: Obx(() {
                  // Check if exercises are loaded
                  if (userController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return TabBarView(
                      children: [
                        PopularTrainings(
                          trainings: userController.exercises['cardio'] ?? [],
                          isLoading: userController.isLoading.value,
                        ),
                        PopularTrainings(
                          trainings: userController.exercises['gym'] ?? [],
                          isLoading: userController.isLoading.value,
                        ),
                        PopularTrainings(
                          trainings: userController.exercises['boxing'] ?? [],
                          isLoading: userController.isLoading.value,
                        ),
                      ],
                    );
                  }
                }),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Best Programs 🔥",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF191919),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
