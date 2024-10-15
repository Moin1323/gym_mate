import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/exercise/instruction.dart';
import 'package:gym_mate/providers/exercise_providers/boxing.dart';
import 'package:gym_mate/providers/exercise_providers/cardio.dart';
import 'package:gym_mate/providers/exercise_providers/gym.dart';

final fireStore = FirebaseFirestore.instance.collection("Workouts");

//TO UPLOAD DATA
void uploadAllExercises() {
  // Upload gym exercises
  for (var exercise in gym) {
    fireStore
        .doc(
            "gym") // or use .collection("gym").doc() to create sub-collections if needed
        .collection("exercises")
        .add(exercise.toJson())
        .then((_) {
      print("Gym exercise '${exercise.name}' uploaded successfully!");
    }).catchError((error) {
      print("Failed to upload gym exercise '${exercise.name}': $error");
    });
  }

  // Upload cardio exercises
  for (var exercise in cardio) {
    fireStore
        .doc("cardio")
        .collection("exercises")
        .add(exercise.toJson())
        .then((_) {
      print("Cardio exercise '${exercise.name}' uploaded successfully!");
    }).catchError((error) {
      print("Failed to upload cardio exercise '${exercise.name}': $error");
    });
  }

  // Upload boxing exercises
  for (var exercise in boxing) {
    fireStore
        .doc("boxing")
        .collection("exercises")
        .add(exercise.toJson())
        .then((_) {
      print("Boxing exercise '${exercise.name}' uploaded successfully!");
    }).catchError((error) {
      print("Failed to upload boxing exercise '${exercise.name}': $error");
    });
  }
}

// TO FETCH DATA
class ExerciseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, List<Exercise>>> fetchAllExercises() async {
    Map<String, List<Exercise>> categorizedExercises = {
      "boxing": [],
      "gym": [], // Changed "strength" to "gym"
      "cardio": [],
    };

    try {
      // Fetch all exercises from Firestore
      QuerySnapshot snapshot = await _firestore
          .collectionGroup(
              "exercises") // Use collectionGroup to get all exercises
          .get();

      // Loop through the documents and categorize them
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<Instruction> instructions = (data['instructions'] as List)
            .map((instruction) => Instruction.fromJson(instruction))
            .toList();

        Exercise exercise = Exercise(
          name: data['name'],
          category: data['category'],
          muscleGroup: data['muscleGroup'],
          equipment: data['equipment'],
          animationUrl: data['animationUrl'],
          difficulty: data['difficulty'],
          instructions: instructions,
        );

        // Print the category to check its value
        print("Exercise category: ${exercise.category}");

        // Add exercise to the appropriate category list
        if (categorizedExercises.containsKey(exercise.category)) {
          categorizedExercises[exercise.category]?.add(exercise);
        } else {
          print("Category not found: ${exercise.category}");
        }
      }
    } catch (e) {
      print("Error fetching exercises: $e");
    }

    return categorizedExercises;
  }
}
