import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/view/dashboard/home/widgets/exercise_component.dart';

class TabBarViewWidget extends StatelessWidget {
  final UserController userController;

  const TabBarViewWidget({super.key, required this.userController});

  @override
  Widget build(BuildContext context) {
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
}
