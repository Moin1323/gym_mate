import 'package:flutter/material.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Set the text color
      ),
      onPressed: isLoading ? null : onPressed, // Disable button when loading
      child: isLoading
          ? CircularProgressIndicator(
              color: AppColors.secondary,
            )
          : Text(
              text,
              style: TextStyle(
                color: AppColors.background,
              ),
            ),
    );
  }
}
