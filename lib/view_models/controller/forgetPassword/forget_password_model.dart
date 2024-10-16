import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  RxBool loading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    emailFocus.dispose();
    super.onClose();
  }

  Future<void> sendPasswordResetEmail() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email field cannot be empty',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    loading.value = true;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Get.defaultDialog(
        title: 'Reset Email Sent',
        content: const Text(
          'A password reset link has been sent to your email. Please check your inbox.',
          textAlign: TextAlign.center,
        ),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('OK'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Failed to send reset email',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loading.value = false;
    }
  }
}
