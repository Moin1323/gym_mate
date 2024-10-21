import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/cnic_formatter.dart';
import 'package:gym_mate/res/components/custom_text_field.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/utils/utils.dart';
import 'package:gym_mate/view_models/controller/signup/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final signupVM = Get.put(SignupViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Transparent overlay with form
          Container(
            color: Colors.black.withOpacity(.7),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 100),

                    // Signup Heading
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Name Field
                    CustomTextField(
                      controller: signupVM.nameController,
                      focusNode: signupVM.nameFocus,
                      labelText: 'Name',
                      hintText: 'Enter your Name',
                      textColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                          context,
                          signupVM.nameFocus,
                          signupVM.emailFocus,
                        );
                      },
                      inputFormatters: const [],
                    ),
                    const SizedBox(height: 25),

                    // Email Field
                    CustomTextField(
                      controller: signupVM.emailController,
                      focusNode: signupVM.emailFocus,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      textColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        }
                        return null;
                      },
                      inputFormatters: const [],
                    ),
                    const SizedBox(height: 25),

                    // CNIC Field
                    // CNIC Field
                    CustomTextField(
                      controller: signupVM.cnicController,
                      focusNode: signupVM.cnicFocus,
                      labelText: 'CNIC',
                      hintText: 'Enter your CNIC',
                      textColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your CNIC";
                        }
                        if (value.length != 15) {
                          return "CNIC must be 14 characters including dashes";
                        }
                        return null;
                      },
                      inputFormatters: [
                        CnicInputFormatter()
                      ], // Add the input formatter here
                    ),

                    const SizedBox(height: 25),

                    // Password Field
                    CustomTextField(
                      controller: signupVM.passwordController,
                      focusNode: signupVM.passwordFocus,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textColor: Colors.white,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      inputFormatters: const [],
                    ),
                    const SizedBox(height: 25),

                    // Confirm Password Field
                    CustomTextField(
                      controller: signupVM.confirmPasswordController,
                      focusNode: signupVM.confirmPasswordFocus,
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      textColor: Colors.white,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please confirm your password";
                        }
                        if (value != signupVM.passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      inputFormatters: const [],
                    ),
                    const SizedBox(height: 60),

                    // SignUp Button
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          signupVM.register();
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
                        return signupVM.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              );
                      }),
                    ),
                    const SizedBox(height: 10),

                    // Login Redirect
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(RoutesName.loginView);
                              },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
