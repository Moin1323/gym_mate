import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/models/equipments/equipments.dart';
import 'package:gym_mate/repository/user_repository/user_repository.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class NewEquipments extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final List<Equipment> equipments; // List of equipments
  final String title;
  final bool isLoading;

  NewEquipments({
    super.key,
    required this.equipments,
    required this.isLoading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.01),
        Row(
          children: [
            Text(
              "New Equipments 🏋️‍♂️",
              style: TextStyle(
                  color: AppColors.secondary, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.005),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: equipments.map((equipment) {
                    return Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.04),
                      child: _buildEquipmentCard(equipment),
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }

  // Helper method to build individual equipment cards
  Widget _buildEquipmentCard(Equipment equipment) {
    return GestureDetector(
      onTap: () {
        // Navigate to EquipmentDetail screen
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: Get.height * 0.30,
              width: Get.width * 0.4,
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Image.network(
                equipment.imageUrl, // Use imageUrl from Equipment model
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image not available'));
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height * 0.30,
              width: Get.width * 0.40,
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      equipment.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      equipment.category,
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
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
