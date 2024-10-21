import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view/dashboard/Exercieses/excersice_datail.dart';
import 'package:gym_mate/view/dashboard/search/widgets/search_textfeild.dart'
    as custom; // Add prefix 'custom'
import 'package:gym_mate/models/exercise/instruction.dart';
import 'package:gym_mate/models/exercise/exercise.dart'; // Import your Exercise model

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  // Stream to listen to all exercises in subcollections under 'Workouts'
  final Stream<QuerySnapshot> _exerciseStream = FirebaseFirestore.instance
      .collectionGroup('exercises') // Fetch from all 'exercises' subcollections
      .snapshots();

  final custom.SearchController controller = Get.put(
      custom.SearchController()); // Use the prefixed 'custom.SearchController'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Set background color
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.06,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: custom
                  .SearchTextfeild(), // Use the prefixed 'custom.SearchTextfeild'
            ),
            SizedBox(height: Get.height * 0.018),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    _exerciseStream, // Listen to Firestore updates in real-time
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Data retrieved from Firestore
                  final data = snapshot.requireData;

                  return Obx(() {
                    // Filter exercises based on search text
                    String searchText =
                        controller.searchText.value.trim().toLowerCase();
                    List<QueryDocumentSnapshot> filteredDocs = searchText
                            .isEmpty
                        ? data
                            .docs // Show all exercises if search field is empty
                        : data.docs.where((doc) {
                            String name =
                                doc['name']?.toString().toLowerCase() ?? '';
                            String category =
                                doc['category']?.toString().toLowerCase() ?? '';
                            String muscleGroup =
                                doc['muscleGroup']?.toString().toLowerCase() ??
                                    '';

                            // Check if searchText is in name, category, or muscleGroup
                            return name.contains(searchText) ||
                                category.contains(searchText) ||
                                muscleGroup.contains(searchText);
                          }).toList();

                    return ListView.builder(
                      itemCount: filteredDocs.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var document = filteredDocs[index];

                        // Assuming the document has the following fields
                        String name = document['name'] ?? 'No name';
                        String category = document['category'] ?? 'No category';
                        String muscleGroup =
                            document['muscleGroup'] ?? 'No muscle group';
                        String equipment =
                            document['equipment'] ?? 'No equipment';
                        String animationUrl = document['animationUrl'] ?? '';
                        String difficulty = document['difficulty'] ?? '';
                        List<Instruction> instructions =
                            (document['instructions'] as List)
                                .map((instruction) =>
                                    Instruction.fromJson(instruction))
                                .toList();

                        // Create Exercise object
                        Exercise exercise = Exercise(
                          name: name,
                          category: category,
                          muscleGroup: muscleGroup,
                          equipment: equipment,
                          animationUrl: animationUrl,
                          difficulty: difficulty,
                          instructions: instructions,
                        );

                        return GestureDetector(
                          onTap: () {
                            // Navigate to ExerciseDetail screen
                            Get.to(() => ExerciseDetail(exercise: exercise));
                          },
                          child: ListTile(
                            title: Text(
                              name,
                              style: TextStyle(
                                color: AppColors.secondary,
                              ),
                            ), // Display the name of the exercise
                            subtitle: Text(
                              'Category: $category\nMuscle Group: $muscleGroup', // Display category and muscle group
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
