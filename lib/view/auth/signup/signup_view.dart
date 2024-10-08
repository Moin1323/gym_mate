import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_text_field.dart';
import 'package:gym_mate/res/routes/routes_name.dart';
import 'package:gym_mate/utils/utils.dart';
import 'package:gym_mate/view/auth/login/login_view.dart';
import 'package:gym_mate/view_models/controller/login/login_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
   final loginVM = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [

          Container(
            decoration:const BoxDecoration(
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
                    SizedBox(height: 100,),
                 const   Align(
                       alignment: Alignment.centerLeft,
                       child:   Text(
                        "Signup",style: TextStyle(color: AppColors.secondary,fontSize: 35,fontFamily: 'Satoshi',)
                        
                      ),


                    ),
                    SizedBox(height:30 ),
                    // TextField for Name
                   
                    CustomTextField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      labelText: 'Name',
                      hintText: 'Enter your Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                    ),
                    const SizedBox(height: 25),
                    
                    // TextField for Email
                    CustomTextField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    
                    // TextField for Cnic
                    CustomTextField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      labelText: 'CNIC',
                      hintText: 'Enter your   CNIC address',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your CNIC";
                        }
                        return null;
                      },
                    ),
                   
                    const SizedBox(height: 25),
                    
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
                      height: 25,
                    ),
                    //confirm password 
                      CustomTextField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      labelText: 'Confirm Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 60),

                   
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            loginVM.loginApi();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                        child: Obx(() {
                          return loginVM.loading.value
                              ? const CircularProgressIndicator(color: Colors.white)
                              :const Text(
                                  'SignUp',
                                  style: TextStyle(color: AppColors.background, fontSize: 20),
                                );
                        }),
                      ),
                      SizedBox(height: 10,),
                    RichText(
  text: TextSpan(
    text: "Already have account ",
    style: TextStyle(color: AppColors.secondary, fontSize: 16),
    children: [
      TextSpan(
        text: "Login",
        style:const TextStyle(
          color: Colors.blue, 
          fontSize: 18,
          fontWeight: FontWeight.bold, 
          decoration: TextDecoration.underline, 
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            
         Get.offNamed(RoutesName
                .loginView);
         
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