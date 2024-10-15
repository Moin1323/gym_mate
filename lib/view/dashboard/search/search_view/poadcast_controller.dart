import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_mate/res/colors/app_colors.dart';

class MyContainer extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subTitle;

  const MyContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: Get.height * 0.35,
      width: Get.width * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              bottom: 15,
              right: 15,
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.secondary,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 28,
                      )))),
          // Bottom center: Text button
          Positioned(
            bottom: 15,
            left: 18,
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 135,
            left: 18,
            child: Center(
              child: Text(
                widget.subTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
