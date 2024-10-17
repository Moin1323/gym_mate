import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userSnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userSnapshot.exists) {
        var userData = userSnapshot.data() as Map<String, dynamic>;
        nameController.text = userData['name'];
        emailController.text = userData['email'];
      }
    }
  }

  Future<void> updateProfile() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      try {
        // Check if the email has changed
        if (emailController.text != currentUser.email) {
          // Send verification email to the new email
          await currentUser.verifyBeforeUpdateEmail(emailController.text);
          Get.snackbar(
            'Email Verification Sent',
            'Please check your new email to verify the address before it can be updated.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
        }

        // Update user data in Firestore
        await _firestore.collection('users').doc(currentUser.uid).update({
          'name': nameController.text,
          'email': emailController.text,
        });

        Get.snackbar(
          'Success',
          'Profile updated successfully (excluding email until verification).',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back();
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'Failed to update email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
