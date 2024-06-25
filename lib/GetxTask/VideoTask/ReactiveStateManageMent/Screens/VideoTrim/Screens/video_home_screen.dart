import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/video_trim_controller.dart';

class VideoHomeScreen extends GetView<VideoHomeController> {
  const VideoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.pickVideo();
          },
          child: const Text("Pick Video"),
        ),
      ),
    );
  }
}
