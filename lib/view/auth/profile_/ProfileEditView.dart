import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_text_field.dart';
import 'package:gym_mate/view_models/controller/profile_controller.dart';
import 'package:gym_mate/res/routes/routes_name.dart';

class ProfileEditView extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text("Edit Profile"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: profileController.nameController,
              focusNode: FocusNode(), // You can manage the focus node as needed
              labelText: 'Name',
              hintText: 'Enter your name',
              textColor: AppColors.secondary,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                // Handle on submitted logic if needed
              },
              inputFormatters: const [], // Add any input formatters if needed
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: profileController.emailController,
              focusNode: FocusNode(), // You can manage the focus node as needed
              labelText: 'Email',
              hintText: 'Enter your email',
              textColor: AppColors.secondary,
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Add email validation logic if needed
                return null;
              },
              onFieldSubmitted: (value) {
                // Handle on submitted logic if needed
              },
              inputFormatters: const [], // Add any input formatters if needed
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Show confirmation dialog before updating
                  bool? confirmChange = await Get.dialog<bool>(
                    AlertDialog(
                      title: const Text('Confirm Changes'),
                      content: const Text(
                          'Are you sure you want to change the details?'),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(result: false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Get.back(result: true),
                          child: const Text('Yes, Change'),
                        ),
                      ],
                    ),
                  );

                  if (confirmChange == true) {
                    // Optional: Close any currently active snackbar
                    if (Get.isSnackbarOpen) {
                      Get.closeCurrentSnackbar();
                    }

                    // Call the updateProfile method from the ProfileController
                    await profileController.updateProfile();

                    // Refresh the app by navigating to the initial screen (replace '/home_view' with your main screen route)
                    Get.offAllNamed(RoutesName
                        .bottomNavigationBar); // Adjust the route name as necessary
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background,
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
