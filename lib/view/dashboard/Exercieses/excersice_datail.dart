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
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: AppColors.secondary),
            onPressed: () => Get.back(),
          ),
          title: Text(
            exercise.name,
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  border: Border.all(color: AppColors.background, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  exercise.animationUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Image not available'));
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Information Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoCard(Icons.category, "Category: ${exercise.category}"),
                    _infoCard(
                        Icons.emoji_flags, "Difficulty: ${exercise.difficulty}"),
                    _infoCard(Icons.sports_gymnastics,
                        "Equipment: ${exercise.equipment}"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: exercise.instructions.length,
                  itemBuilder: (context, index) {
                    int val = index + 1;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0,
                        borderOnForeground: true,
                        color: AppColors.secondary.withOpacity(.1),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: ListTile(
                            // leading: Image.asset(ImageAssets.dumbell1),
                            leading: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                val.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.background,
                                ),
                              )),
                            ),

                            title: Text(
                              exercise.instructions[index].details,
                              style: TextStyle(
                                  color: AppColors.secondary, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
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
    }

    Widget _infoCard(IconData icon, String text) {
      return Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.secondary),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondary),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: AppColors.secondary),
            ),
          ],
        ),
      );
    }
  }
