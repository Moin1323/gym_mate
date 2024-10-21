import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/login/user_model.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';
import 'package:gym_mate/view/dashboard/Exercieses/excersice_datail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_mate/models/equipments/equipments.dart'; // Import your Equipment model
import 'package:gym_mate/services/equipment_service.dart'; // Import the EquipmentService

class UserController extends GetxController {
  var user = UserModel().obs;
  var exercises =
      <String, List<Exercise>>{}.obs; // For storing categorized exercises
  var equipments = <Equipment>[].obs; // Observable list for storing equipments
  var isLoading = true.obs;
  var singleExercise = Exercise(
          name: "",
          instructions: [],
          category: '',
          muscleGroup: '',
          equipment: '',
          animationUrl: '',
          difficulty: '')
      .obs; // For storing a single exercise

  final EquipmentService _equipmentService =
      EquipmentService(); // Initialize EquipmentService

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchAllExercises();
    fetchAllEquipments(); // Fetch equipments on initialization
  }

  // New method to fetch all equipments
  Future<void> fetchAllEquipments() async {
    isLoading.value = true; // Start loading
    try {
      List<Equipment> equipmentList =
          await _equipmentService.fetchAllEquipments();
      equipments.value = equipmentList; // Update the observable variable
      print("Equipments fetched successfully: ${equipments.value}");
    } catch (e) {
      print("Error fetching equipments: $e");
      Get.snackbar(
        "Error",
        "Failed to fetch equipment data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> fetchUserData() async {
    isLoading.value = true; // Start loading
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;
        print("Current User ID: $userId");

        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (snapshot.exists) {
          user.value =
              UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        } else {
          await _handleLogout(); // Handle logout if user data does not exist
        }
      } else {
        await _handleLogout(); // Handle logout if no user is signed in
      }
    } catch (e) {
      print("Error fetching user data: $e");
      Get.snackbar(
        "Error",
        "Failed to fetch user data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
      await _handleLogout(); // Handle logout on error
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> _handleLogout() async {
    // Sign out the user
    await FirebaseAuth.instance.signOut();
    // Optionally clear shared preferences for login status
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    // Redirect to login view
    Get.offAll(() => const LoginView()); // Ensure to import your login view
  }

  Future<void> fetchAllExercises() async {
    isLoading.value = true; // Start loading
    try {
      // Initialize categorized exercises
      Map<String, List<Exercise>> categorizedExercises = {
        "boxing": [],
        "gym": [],
        "cardio": [],
      };

      // List of workout categories to fetch exercises from
      List<String> categories = ['boxing', 'gym', 'cardio'];

      // Loop through each category and fetch exercises
      for (String category in categories) {
        print("Fetching exercises for $category..."); // Debugging log

        // Access the subcollection 'exercises' under each category
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('Workouts')
            .doc(category)
            .collection('exercises')
            .get();

        // Check if snapshot has documents
        if (snapshot.docs.isEmpty) {
          print("No exercises found for $category."); // Debugging log
          continue;
        }

        // Loop through the fetched documents
        for (var doc in snapshot.docs) {
          if (doc.exists) {
            Exercise exercise =
                Exercise.fromJson(doc.data() as Map<String, dynamic>);

            // Add exercise to the appropriate category
            categorizedExercises[category]?.add(exercise);
            print(
                "Added exercise: ${exercise.name} to $category"); // Debugging log
          } else {
            print(
                "Document ${doc.id} in $category has no data."); // Debugging log
          }
        }
      }

      // Update the observable variable
      exercises.value = categorizedExercises;
      print("Exercises fetched successfully: ${exercises.value}");
    } catch (e) {
      print("Error fetching exercises: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> fetchSingleExercise(String name) async {
    isLoading.value = true; // Start loading
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Workouts')
          .doc('gym') // Assuming you want to fetch from the 'gym' category
          .collection('exercises')
          .doc(name) // Use the specific exercise ID here
          .get();

      if (snapshot.exists) {
        singleExercise.value =
            Exercise.fromJson(snapshot.data() as Map<String, dynamic>);
        print("Fetched single exercise: ${singleExercise.value.name}");
      } else {
        print("No exercise found for ID: $name");
      }
    } catch (e) {
      print("Error fetching single exercise: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> selectExercise(String name) async {
    await fetchSingleExercise(name); // Fetch the exercise details

    Get.to(() => ExerciseDetail(exercise: singleExercise.value));
  }
}
