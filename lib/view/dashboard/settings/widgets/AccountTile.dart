import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/theme/theme_controller.dart';

class AccountTile extends StatelessWidget {
  final String accountName;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final bool showSwitch;
  final Widget? destinationScreen;
  final ThemeController themeController =
      Get.put(ThemeController()); // Ensures themeController is available
  final VoidCallback? onPressed;

  AccountTile({
    super.key,
    required this.accountName,
    required this.leadingIcon,
    this.trailingIcon,
    this.showSwitch = false,
    this.destinationScreen,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: _buildLeadingIcon(),
          title: Text(
            accountName,
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: showSwitch ? _buildSwitch() : _buildTrailingIcon(),
          onTap: onPressed ??
              () {
                if (destinationScreen != null) {
                  Get.to(destinationScreen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No destination specified.')),
                  );
                }
              },
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: Get.width * 0.1,
      height: Get.height * 0.04,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          leadingIcon,
          size: 25,
          color: AppColors.background,
        ),
      ),
    );
  }

  Widget _buildTrailingIcon() {
    return trailingIcon != null
        ? Icon(
            trailingIcon,
            size: 25,
            color: AppColors.secondary,
          )
        : const SizedBox.shrink();
  }

  Widget _buildSwitch() {
    return Obx(() {
      return CupertinoSwitch(
        value: themeController.themeMode.value == ThemeMode.dark,
        activeColor: AppColors.primary,
        onChanged: (value) {
          themeController.toggleTheme();
        },
      );
    });
  }
}
