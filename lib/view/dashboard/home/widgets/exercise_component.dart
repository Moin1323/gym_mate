import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/view/dashboard/Exercieses/excersice_datail.dart';
import 'package:gym_mate/view/dashboard/Exercieses/main_exercises_view.dart';

class PopularTrainings extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final List<Exercise> trainings;
  final String title;
  final bool isLoading;

   PopularTrainings({
    super.key,
    required this.trainings,
    required this.isLoading, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.01),
        Row(
          children: [
            const Text(
              "Popular Trainings 🔥",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Get.to(() => MainExercisesView(title: title ,exercises: trainings));

              },
              child: const Text(
                'See all',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.005),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: trainings.map((training) {
                    return Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.04),
                      child: _buildTrainingCard(training),
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }

  // Helper method to build individual training cards
Widget _buildTrainingCard(Exercise training) {
  return GestureDetector(
    onTap: () {
      // Navigate to ExerciseDetail screen
      Get.to(() => ExerciseDetail(exercise: training));
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: Get.height * 0.30,
            width: Get.width * 0.70,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.network(
              training.animationUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image not available'));
              },
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            height: Get.height * 0.04,
            width: Get.width * 0.15,
            decoration: BoxDecoration(
              color: const Color(0xFF485B6C),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                '⭐ ',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Text(
            training.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Positioned(
          bottom: 7,
          left: 27,
          child: Text(
            training.category,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ],
    ),
  );
}

}
