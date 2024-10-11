import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Model.dart';

class PopularTrainings extends StatelessWidget {
  final List<TrainingData> trainings;

  // Constructor to accept a list of training data
  const PopularTrainings({super.key, required this.trainings});

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
              onPressed: () {},
              child: const Text(
                'See all',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.005),
        SingleChildScrollView(
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
  Widget _buildTrainingCard(TrainingData training) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: Get.height * 0.30,
            width: Get.width * 0.70,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              training.imageUrl,
              fit: BoxFit.cover,
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
              child: Text(
                '⭐ ${training.rating}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Text(
            training.trainingTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Positioned(
          bottom: 7,
          left: 27,
          child: Text(
            training.taskCount,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
