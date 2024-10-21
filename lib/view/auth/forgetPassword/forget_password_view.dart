import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/view_models/controller/forgetPassword/forget_password_model.dart';
// Adjust the path according to your project structure

class ForgotPasswordView extends StatelessWidget {
  final ResetPasswordController reset = Get.put(ResetPasswordController());

  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.secondary,
            )),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Enter your registered email address and we’ll send you a link to reset your password.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email Input Field
              TextField(
                controller: reset.emailController,
                style: TextStyle(color: AppColors.secondary),
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your registered email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColors.secondary,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 30),

              // Send Reset Email Button
              ElevatedButton(
                onPressed: () {
                  reset.resetPassword();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: Obx(() {
                  return reset.isLoading.value
                      ? CircularProgressIndicator(color: AppColors.secondary)
                      : Text(
                          'Send Reset Email',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.background,
                          ),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
