import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/all_controller.dart';

class ImageScreen extends GetView<ImageController> {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImageController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => controller.selectedImagePath.value == ""
                      ? const Text("Select image from camera/gallery")
                      : Image.file(
                          File(controller.selectedImagePath.value),
                        ),
                ),
                Obx(
                  () => Text(controller.selectedImageSize.value == ""
                      ? ""
                      : controller.selectedImageSize.value),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  child: const Text("Camera"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: const Text("Gallery"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
