import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/login/user_model.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';
import 'package:gym_mate/view/dashboard/Exercieses/excersice_datail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gym_mate/models/equipments/equipments.dart';
import 'package:gym_mate/services/equipment_service.dart';

class UserController extends GetxController {
  // Observable fields
  var user = UserModel().obs;
  var exercises = <String, List<Exercise>>{}.obs;
  var equipments = <Equipment>[].obs;
  var isLoading = true.obs;
  var singleExercise = Exercise(
          id: "",
          name: "",
          instructions: [],
          category: '',
          muscleGroup: '',
          equipment: '',
          animationUrl: '',
          difficulty: '')
      .obs;

  final EquipmentService _equipmentService = EquipmentService();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchAllExercises();
    fetchAllEquipments();
  }

  // Method to fetch all equipments
  Future<void> fetchAllEquipments() async {
    isLoading.value = true;
    try {
      equipments.value = await _equipmentService.fetchAllEquipments();
      print("Equipments fetched successfully: ${equipments.value}");
    } catch (e) {
      print("Error fetching equipments: $e");
      Get.snackbar(
        "Error",
        "Failed to fetch equipment data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Method to fetch user data
  Future<void> fetchUserData() async {
    isLoading.value = true;
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (snapshot.exists) {
          UserModel fetchedUser =
              UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
          fetchedUser.uid = userId;
          user.value = fetchedUser;
          print(
              "Fetched User Details: ${user.value.name}, UID: ${user.value.uid}");
        } else {
          await _handleLogout();
        }
      } else {
        await _handleLogout();
      }
    } catch (e) {
      print("Error fetching user data: $e");
      Get.snackbar(
        "Error",
        "Failed to fetch user data. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
      );
      await _handleLogout();
    } finally {
      isLoading.value = false;
    }
  }

  // Handle logout functionality
  Future<void> _handleLogout() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Get.offAll(() => const LoginView());
  }

  // Method to fetch all exercises for different categories
  Future<void> fetchAllExercises() async {
    isLoading.value = true;
    try {
      Map<String, List<Exercise>> categorizedExercises = {
        "boxing": [],
        "gym": [],
        "cardio": [],
      };

      // Define workout categories
      List<String> categories = ['boxing', 'gym', 'cardio'];

      for (String category in categories) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('Workouts')
            .doc(category)
            .collection('exercises')
            .get();

        if (snapshot.docs.isEmpty) continue;

        for (var doc in snapshot.docs) {
          if (doc.exists) {
            Exercise exercise =
                Exercise.fromJson(doc.data() as Map<String, dynamic>);
            exercise.id = doc.id;
            categorizedExercises[category]?.add(exercise);
          }
        }
      }
      exercises.value = categorizedExercises;
      print("Exercises fetched successfully: ${exercises.value}");
    } catch (e) {
      print("Error fetching exercises: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Method to fetch a single exercise by ID
  Future<void> fetchSingleExercise(String id) async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collectionGroup('exercises')
          .where(FieldPath.documentId, isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot snapshot = querySnapshot.docs.first;
        singleExercise.value =
            Exercise.fromJson(snapshot.data() as Map<String, dynamic>);
        singleExercise.value.id = snapshot.id;
        print("Fetched single exercise: ${singleExercise.value.name}");
      } else {
        print("No exercise found for ID: $id");
      }
    } catch (e) {
      print("Error fetching single exercise: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to Exercise Detail page with the selected exercise
  Future<void> selectExercise(String id) async {
    await fetchSingleExercise(id);
    Get.to(() => ExerciseDetail(exercise: singleExercise.value));
  }
}
