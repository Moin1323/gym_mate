import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/exercise/instruction.dart';
import 'package:gym_mate/providers/exercise_providers/boxing.dart';
import 'package:gym_mate/providers/exercise_providers/cardio.dart';
import 'package:gym_mate/providers/exercise_providers/gym.dart';

final fireStore = FirebaseFirestore.instance.collection("Workouts");

class ExerciseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// TO UPLOAD DATA
  void uploadAllExercises() {
    // Upload gym exercises
    for (var exercise in gym) {
      var docRef = fireStore.doc("gym").collection("exercises").doc();
      exercise.id = docRef.id; // Set the unique Firestore ID to the exercise

      docRef.set(exercise.toJson()).then((_) {
        print(
            "Gym exercise '${exercise.name}' uploaded successfully with ID: ${exercise.id}");
      }).catchError((error) {
        print("Failed to upload gym exercise '${exercise.name}': $error");
      });
    }

    // Upload cardio exercises
    for (var exercise in cardio) {
      var docRef = fireStore.doc("cardio").collection("exercises").doc();
      exercise.id = docRef.id;

      docRef.set(exercise.toJson()).then((_) {
        print(
            "Cardio exercise '${exercise.name}' uploaded successfully with ID: ${exercise.id}");
      }).catchError((error) {
        print("Failed to upload cardio exercise '${exercise.name}': $error");
      });
    }

    // Upload boxing exercises
    for (var exercise in boxing) {
      var docRef = fireStore.doc("boxing").collection("exercises").doc();
      exercise.id = docRef.id;

      docRef.set(exercise.toJson()).then((_) {
        print(
            "Boxing exercise '${exercise.name}' uploaded successfully with ID: ${exercise.id}");
      }).catchError((error) {
        print("Failed to upload boxing exercise '${exercise.name}': $error");
      });
    }
  }

  // TO FETCH DATA
  Future<Map<String, List<Exercise>>> fetchAllExercises() async {
    Map<String, List<Exercise>> categorizedExercises = {
      "boxing": [],
      "gym": [],
      "cardio": [],
    };

    try {
      // Fetch all exercises from Firestore
      QuerySnapshot snapshot =
          await _firestore.collectionGroup("exercises").get();

      // Loop through the documents and categorize them
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<Instruction> instructions = (data['instructions'] as List)
            .map((instruction) => Instruction.fromJson(instruction))
            .toList();

        Exercise exercise = Exercise(
          id: doc.id, // Assign document ID from Firestore to exercise
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
