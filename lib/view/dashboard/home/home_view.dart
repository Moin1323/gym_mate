import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/view/dashboard/home/widgets/Model.dart';
import 'package:iconsax/iconsax.dart';

import '../../../res/colors/app_colors.dart';
import 'widgets/exercise_component.dart';
import 'widgets/tb_component.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // Create a list of training data for cardio
    final List<TrainingData> trainingListCardio = [
      TrainingData(
        imageUrl:
            'lib/assets/images/CardioMain.jpg', // Replace with your actual image paths
        trainingTitle: 'Cardio\nTraining',
        taskCount: '27 Tasks',
        rating: 4.7,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/Cardio4.jpg',
        trainingTitle: 'Cardio\nTraining',
        taskCount: '18 Tasks',
        rating: 4.8,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/Cardio3.jpg',
        trainingTitle: 'Cardio\nTraining',
        taskCount: '22 Tasks',
        rating: 4.5,
      ),
    ];

    // Create a list of training data for gym
    final List<TrainingData> trainingListGym = [
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Strength\n Training',
        taskCount: '30 Tasks',
        rating: 4.9,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Full Body\n Workout',
        taskCount: '25 Tasks',
        rating: 4.8,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Weightlifting\n Basics',
        taskCount: '20 Tasks',
        rating: 4.6,
      ),
    ];

    // Create a list of training data for boxing
    final List<TrainingData> trainingListBoxing = [
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Boxing \nFundamentals',
        taskCount: '15 Tasks',
        rating: 4.7,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Advanced \nBoxing Techniques',
        taskCount: '10 Tasks',
        rating: 4.8,
      ),
      TrainingData(
        imageUrl: 'lib/assets/images/CardioMain.jpg', // Original image path
        trainingTitle: 'Conditioning \nfor Boxers',
        taskCount: '12 Tasks',
        rating: 4.5,
      ),
    ];

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.032),
              // Header Section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Ramin 💪🏻',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'This Is Behealth',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        print('Notification icon pressed');
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
                indicatorColor:
                    AppColors.primary, // Customize the indicator color
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
                child: TabBarView(
                  children: [
                    // Cardio
                    PopularTrainings(
                        trainings:
                            trainingListCardio), // Pass the list to the widget
                    // Gym
                    SizedBox(
                      child: PopularTrainings(
                        trainings:
                            trainingListGym, // Pass the same or a different list
                      ),
                    ),
                    // Boxing
                    SizedBox(
                      child: PopularTrainings(
                        trainings:
                            trainingListBoxing, // Pass the same or a different list
                      ),
                    ),
                  ],
                ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
