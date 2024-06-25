import 'dart:io';

import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:panorama/panorama.dart';

class PanoramaScreen extends GetView<PanoramaController> {
  const PanoramaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PanoramaController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // mini: true,
        onPressed: () {
          controller.getImage(ImageSource.camera);
        },
        child: const Icon(Icons.panorama),
      ),
      // body: Obx(
      //   () => Panorama(
      //     zoom: 1,
      //     animSpeed: 1.0,
      //     child: controller.selectImagePath.value != ""
      //         ? Image.file(File(controller.selectImagePath.value))
      //         : Image.asset("assets/Images/trees.webp"),
      //   ),
      // ),
    );
  }
}
