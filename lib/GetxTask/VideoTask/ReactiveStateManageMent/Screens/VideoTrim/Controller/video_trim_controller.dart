import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoHomeController extends GetxController {
  final Trimmer trimmer = Trimmer();
  var startValue = 0.0.obs;
  var endValue = 0.0.obs;
  pickVideo() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.video, allowCompression: false);
    if (result != null) {
      File file = File(result.files.single.path!);
      Get.toNamed("/videoTrim", arguments: file);
    }
  }
}

class VideoTrimmingController extends GetxController {
  final Trimmer trimmer = Trimmer();
  var startValue = 0.0.obs;
  var endValue = 0.0.obs;
  var isPlaying = false.obs;
  var progressVisible = false.obs;
  @override
  void onInit() {
    super.onInit();
    loadVideo();
  }

  loadVideo() {
    trimmer.loadVideo(videoFile: Get.arguments);
  }

  saveVideo() async {
    progressVisible.value = true;
    String? result;
    await trimmer.saveTrimmedVideo(
      startValue: startValue.value,
      endValue: endValue.value,
      onSave: (outputPath) {
        progressVisible.value = false;
        result = outputPath;
        Get.snackbar(
          "Video",
          result!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      },
    );
  }
}

class VideoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideoHomeController>(VideoHomeController());
  }
}

class VideoTrimBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VideoTrimmingController>(VideoTrimmingController());
  }
}
