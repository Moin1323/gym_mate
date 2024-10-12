import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOverlayCard extends StatelessWidget {
  final String imagePath;
  final String overlayText;
  final VoidCallback onBookmarkPressed; // Callback for the bookmark button

  const ImageOverlayCard({
    Key? key,
    required this.imagePath,
    required this.overlayText,
    required this.onBookmarkPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: Get.height * 0.3,
        width: Get.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // Image as background
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath), // Your image path
                  fit: BoxFit.cover, // Adjust the image to cover the container
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Text(
                overlayText, // Overlay text
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add icon on top of the image
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: onBookmarkPressed, // Callback for icon button
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 25,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
