import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickScreen extends StatefulWidget {
  const VideoPickScreen({super.key});

  @override
  State<VideoPickScreen> createState() => _VideoPickScreenState();
}

class _VideoPickScreenState extends State<VideoPickScreen> {
  ImagePicker picker = ImagePicker();
  late VideoPlayerController controller;
  File? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          XFile? file = await picker.pickVideo(source: ImageSource.gallery);
          if (file != null) {
            video = File(file.path);
            controller = VideoPlayerController.file(video!)
              ..initialize().then((_) {
                setState(() {});
              });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: video != null
            ? Column(
                children: [
                  SizedBox(
                    height: 630,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        VideoPlayer(controller),
                        VideoProgressIndicator(controller,
                            allowScrubbing: true),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: controller.value.isPlaying
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: Icon(Icons.video_call),
              ),
      ),
    );
  }
}
