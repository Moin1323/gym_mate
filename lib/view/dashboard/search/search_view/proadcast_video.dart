import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoLoader extends StatefulWidget {
  const VideoLoader({super.key});

  @override
  State<VideoLoader> createState() => _VideoLoaderState();
}

class _VideoLoaderState extends State<VideoLoader> {
  final videoURL = "https://www.youtube.com/watch?v=eaRQF-7hhmo";
  late YoutubePlayerController _controller;
  String? videoID;

  @override
  void initState() {
    super.initState();
    // Extract video ID from the URL
    videoID = YoutubePlayer.convertUrlToId(videoURL);

    if (videoID != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false, // Ensure the video is not muted
        ),
      );
    } else {
      // Handle invalid video URL
      print("Invalid video URL");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      height: Get.height * 0.24,
      width: Get.width * 0.92, // Increased width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.black, // Background color while video loads
      ),
      child: videoID != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: AspectRatio(
                aspectRatio: 16 / 9, // Standard aspect ratio for videos
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  onReady: () => debugPrint('Player is ready'),
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                    ),
                    PlaybackSpeedButton(),
                  ],
                ),
              ),
            )
          : Center(
              child: Text(
                'Invalid video URL or Video ID',
                style: TextStyle(color: Colors.red),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
