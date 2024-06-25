import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/VideoTrim/Controller/video_trim_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoTrimScreen extends GetView<VideoTrimmingController> {
  const VideoTrimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(
                  () => Visibility(
                    visible: controller.progressVisible.value,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.progressVisible.value
                      ? null
                      : () async {
                          controller.saveVideo();
                        },
                  child: const Text("Save"),
                ),
                Expanded(
                  child: VideoViewer(
                    trimmer: controller.trimmer,
                  ),
                ),
                Center(
                  child: TrimViewer(
                    trimmer: controller.trimmer,
                    viewerHeight: 50,
                    viewerWidth: Get.width,
                    maxVideoLength: Duration(
                        seconds: controller.trimmer.videoPlayerController!.value
                            .duration.inSeconds),
                    onChangeStart: (startValue) {
                      controller.startValue.value = startValue;
                    },
                    onChangeEnd: (endValue) {
                      controller.endValue.value = endValue;
                    },
                    onChangePlaybackState: (isPlaying) {
                      controller.isPlaying.value = false;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    bool playBackState = await controller.trimmer
                        .videoPlaybackControl(
                            startValue: controller.startValue.value,
                            endValue: controller.endValue.value);
                    controller.isPlaying.value = playBackState;
                  },
                  child: controller.isPlaying.value
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
