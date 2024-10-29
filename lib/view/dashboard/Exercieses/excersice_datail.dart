import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_primary_button.dart';

class ExerciseDetail extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetail({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.network(
                exercise.animationUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image not available'));
                },
              ),
            ),
          ),

          // Back Button on Image
          Positioned(
            top: 50,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ),

          // DraggableScrollableSheet for the scrollable bottom container
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.55,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Exercise Name
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          exercise.name,
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Info Container for Exercise Details
                      _infoContainer(exercise),
                      const SizedBox(height: 30),

                      // Instruction List
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: exercise.instructions.length,
                        itemBuilder: (context, index) {
                          int stepNumber = index + 1;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 0,
                              color: AppColors.secondary.withOpacity(0.1),
                              child: ListTile(
                                leading: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      stepNumber.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.background,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  exercise.instructions[index].details,
                                  style: TextStyle(
                                    color: AppColors.secondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Done Button
                      Center(
                        child: CustomPrimaryButton(
                          text: 'Done',
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _infoContainer(Exercise exercise) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _infoRow(Icons.category, exercise.category),
              const SizedBox(width: 20),
              _infoRow(Icons.emoji_flags, exercise.difficulty),
              const SizedBox(width: 20),
              _infoRow(Icons.fitness_center, exercise.equipment),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.secondary),
        const SizedBox(width: 5),
        Text(text, style: TextStyle(color: AppColors.secondary)),
      ],
    );
  }
}
