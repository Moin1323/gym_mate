import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_primary_button.dart';
import 'package:gym_mate/utils/utils.dart';
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
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.background),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: AppColors.background.withOpacity(.7),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Login",
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 35,
                          )),
                    ),
                    const SizedBox(height: 30),
                    // TextField for Email

                    CustomTextField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                    ),
                    const SizedBox(height: 30),

                    // TextField for Password
                    CustomTextField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot your password?",
                          style: TextStyle(
                              color: AppColors.secondary, fontSize: 16)),
                    ),
                    const SizedBox(height: 60),

                    CustomPrimaryButton(
                      text: 'Login',
                      isLoading: loginVM.loading.value,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginVM.loginApi();
                        }
                      },
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                            color: AppColors.secondary, fontSize: 16),
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
                                Get.to(const SignupView());
                                //Get.offNamed(RoutesName.signUpView);
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
