import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
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
    _initializeData();
  }

  Future<void> _initializeData() async {
    await userController.fetchUserData();
    await userController.fetchAllExercises();
    notificationServices.requestNotificationPermission();
    notificationServices.initLocalNotifications(context, const RemoteMessage());
    notificationServices.firebaseInit();
    String? token = await notificationServices.getDeviceToken();
    print('Device token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildBanner(),
              const SizedBox(height: 10),
              _buildTabBar(),
              _buildTabBarView(),
              _buildBestProgramsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 10, right: 10, bottom: 10),
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
              Get.to(const notifications_view());
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

  Widget _buildBanner() {
    return Container(
      height: Get.height * 0.14,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Image.asset(
          ImageAssets.logo,
          color: AppColors.background,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.primary,
      tabs: const [
        TabrComponent(
          label: 'Cardio',
          imageAsset: 'lib/assets/images/cardio2.png',
        ),
        TabrComponent(
          label: 'Gym',
          imageAsset: 'lib/assets/images/dumbbell.png',
        ),
        TabrComponent(
          label: 'Boxing',
          imageAsset: 'lib/assets/images/boxing.png',
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return TabBarView(
            children: [
              PopularTrainings(
                trainings: userController.exercises['cardio'] ?? [],
                isLoading: userController.isLoading.value,
                title: 'Cardio',
              ),
              PopularTrainings(
                trainings: userController.exercises['gym'] ?? [],
                isLoading: userController.isLoading.value,
                title: "Gym",
              ),
              PopularTrainings(
                trainings: userController.exercises['boxing'] ?? [],
                isLoading: userController.isLoading.value,
                title: "Boxing",
              ),
            ],
          );
        }
      }),
    );
  }

  Widget _buildBestProgramsSection() {
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
