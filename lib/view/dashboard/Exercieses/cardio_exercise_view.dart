import 'package:flutter/material.dart';
import 'package:gym_mate/res/assets/image_assets.dart';
import 'package:gym_mate/res/colors/app_colors.dart';
import 'package:gym_mate/res/components/custom_bottom_nav_bar.dart';

class CardioExersiseView extends StatefulWidget {
  const CardioExersiseView({super.key});

  @override
  State<CardioExersiseView> createState() => _CardioExersiseViewState();
}

class _CardioExersiseViewState extends State<CardioExersiseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white, size: 30),
        backgroundColor: AppColors.background,
        title: const Text(
          "Cardio Exercises",
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add some padding around the GridView
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items in a row
            crossAxisSpacing: 15, // Space between items horizontally
            mainAxisSpacing: 10, // Space between items vertically
            childAspectRatio: 1, // Aspect ratio for each item
          ),
          itemCount: 10, // Change this to the actual number of exercises
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border:Border.all(color: AppColors.primary.withOpacity(.5)),
                image: DecorationImage(
                  image: const AssetImage(ImageAssets.yoga), // Path to your image
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.3),
                    BlendMode.dstATop,
                  ),
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0,bottom: 10),
                  child: Text(
                    "Yoga",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap:(value) {},
      ),
    );
    
  }
}
