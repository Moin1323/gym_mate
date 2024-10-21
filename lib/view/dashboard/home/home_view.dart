import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/services/notifications_service.dart';
import 'package:gym_mate/view/dashboard/home/widgets/banner_widget.dart';
import 'package:gym_mate/view/dashboard/home/widgets/best_programs_section_widget.dart';
import 'package:gym_mate/view/dashboard/home/widgets/header_widget.dart';
import 'package:gym_mate/view/dashboard/home/widgets/tab_bar_view_widget.dart';
import 'package:gym_mate/view/dashboard/home/widgets/tab_bar_widget.dart';

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
              const SizedBox(height: 10),
              HeaderWidget(userController: userController),
              const SizedBox(height: 10),
              const BannerWidget(),
              const SizedBox(height: 10),
              const TabBarWidget(),
              TabBarViewWidget(userController: userController),
              const BestProgramsSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
