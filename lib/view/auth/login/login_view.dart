import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/utils/utils.dart';
import 'package:gym_mate/view/auth/forgetPassword/forget_password_view.dart';
import 'package:gym_mate/view/auth/signup/signup_view.dart';
import 'package:gym_mate/view_models/controller/login/login_view_model.dart';
import 'package:gym_mate/res/components/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Enable for keyboard adjustment
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Container(
              height: MediaQuery.of(context).size.height, // Full-screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Transparent overlay
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(.7),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 150),
                      // Title: Login
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'Satoshi',
                            )),
                      ),
                      const SizedBox(height: 30),
                      // Email TextField
                      CustomTextField(
                        controller: loginVM.emailController,
                        focusNode: loginVM.emailFocusNode,
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                        textColor: Colors.white,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                            context,
                            loginVM.emailFocusNode,
                            loginVM.passwordFocusNode,
                          );
                        },
                        inputFormatters: const [],
                      ),
                      const SizedBox(height: 30),
                      // Password TextField
                      CustomTextField(
                        controller: loginVM.passwordController,
                        focusNode: loginVM.passwordFocusNode,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        textColor: Colors.white,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 6) {
                            return "Password must be at least 6 characters long";
                          }
                          return null;
                        },
                        inputFormatters: const [],
                      ),
                      const SizedBox(height: 10),
                      // Forgot Password
                      TextButton(
                        onPressed: () {
                          Get.to(() =>
                              ForgotPasswordView()); // Navigate to ForgotPasswordView
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginVM.loginApi(); // Trigger login API call
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                        child: Obx(() {
                          return loginVM.loading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                );
                        }),
                      ),
                      const SizedBox(height: 10),
                      // Signup Redirect
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Signup",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(() =>
                                      const SignupView()); // Navigate to SignupView
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
