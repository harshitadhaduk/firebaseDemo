import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetBuilder<VideoController>(
            init: VideoController(),
            builder: (controller) => Expanded(
                child: Center(
              child: controller.chewieController != null &&
                      controller.chewieController!.videoPlayerController.value
                          .isInitialized
                  ? Chewie(controller: controller.chewieController!)
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Loading"),
                      ],
                    ),
            )),
          )
        ],
      ),
    );
  }
}
