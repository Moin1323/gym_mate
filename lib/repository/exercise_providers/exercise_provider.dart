import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/repository/exercise_providers/boxing.dart';
import 'package:gym_mate/repository/exercise_providers/cardio.dart';
import 'package:gym_mate/repository/exercise_providers/gym.dart';

final fireStore = FirebaseFirestore.instance.collection("Workouts");

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
