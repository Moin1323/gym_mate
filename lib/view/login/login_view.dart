import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/utils/utils.dart';
import 'package:gym_mate/view_models/controller/login_view_model.dart';

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
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: loginVM.emailController.value,
                focusNode: loginVM.emailFocusNode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar("Email", "Enter Email");
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
                      loginVM.passwordFocusNode.value);
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your Email',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: loginVM.passwordController.value,
                obscureText: true,
                focusNode: loginVM.passwordFocusNode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar("Password", "Enter Passowrd");
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  // Utils.fieldFocusChange(context, loginVM.passwordFocusNode.value,
                  //     loginVM.emailFocusNode.value);
                },
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 30),
              // Assuming you have a login view model using GetX
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    loginVM.loginApi(); // Trigger API call
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15), // Custom padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Custom rounded button
                  ),
                ),
                child: Obx(() {
                  return loginVM
                          .loading.value // Check if API call is in progress
                      ? const CircularProgressIndicator(
                          color: Colors.white) // Show loading spinner
                      : const Text('Login'); // Default button text
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
