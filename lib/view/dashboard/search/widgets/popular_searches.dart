import 'package:flutter/material.dart';

class WorkoutTag extends StatelessWidget {
  final String emoji;
  final String title;
  final double width; // New property for dynamic width

  const WorkoutTag({
    Key? key,
    required this.title,
    required this.emoji,
    this.width = 130, // Default width value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: width, // Use the dynamic width property
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white10,
                child: Text(emoji), // Display the icon
              ),
              const SizedBox(width: 5), // Space between icon and text
              Text(
                title, // Title of the tag
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
