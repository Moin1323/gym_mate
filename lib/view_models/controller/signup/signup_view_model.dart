import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';

import '../../../services/notifications_service.dart';

class SignupViewModel extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode cnicFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  RxBool loading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    cnicController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    cnicFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.onClose();
  }

  Future<void> register() async {
    loading.value = true;

    // Input Validation
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        nameController.text.isEmpty ||
        cnicController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required',
          backgroundColor: Colors.red, colorText: Colors.white);
      loading.value = false;
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
          backgroundColor: Colors.red, colorText: Colors.white);
      loading.value = false;
      return;
    }

    try {
      // Firebase Auth sign-up
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Fetch device token for push notifications
      String deviceToken = await NotificationServices().getDeviceToken();

      // Save user details along with the device token and role in Firestore
      await saveUserDetails(userCredential.user!.uid, deviceToken);

      // Notify user of successful registration
      Get.defaultDialog(
        title: 'Registration Successful',
        content: const Text(
          'You have successfully registered. You can now log in.',
          textAlign: TextAlign.center,
        ),
        confirm: ElevatedButton(
          onPressed: () {
            Get.offAll(() => const LoginView());
          },
          child: const Text('OK'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Registration failed',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loading.value = false;
    }
  }

  Future<void> saveUserDetails(String userId, String deviceToken) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'uid': userId, // Include the uid field
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'cnic': cnicController.text.trim(),
        'token': deviceToken, // Save the device token as "token"
        'role': 'User', // Save the role as "User"
        'createdAt': FieldValue.serverTimestamp(), // Save creation date
      });
      print('User details saved successfully for user ID: $userId');
    } catch (e) {
      print('Failed to save user details: $e');
      Get.snackbar('Error', 'Failed to save user details.',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
