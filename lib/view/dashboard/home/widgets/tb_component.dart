import 'package:flutter/material.dart';

class TabrComponent extends StatelessWidget {
  final String imageAsset; // Image asset path
  final String label; // Text label for the tab

  const TabrComponent({
    super.key,
    required this.imageAsset,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 60, // Height of the container
        width: 120, // Width of the container
        decoration: BoxDecoration(
          color: Colors.white24, // Background color for the container
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              CircleAvatar(
                backgroundColor:
                    Colors.white10, // Background color for the avatar
                radius: 15, // Size of the CircleAvatar
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                      imageAsset, // Use the imageAsset parameter
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  width: 5), // Spacing between the image and the text
              Text(
                label, // Use the label parameter
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 18, // Font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
