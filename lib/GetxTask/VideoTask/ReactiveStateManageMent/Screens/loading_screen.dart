import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends GetView<LoadingController> {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoadingController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => ElevatedButton.icon(
            onPressed: controller.isLoading.value
                ? null
                : () => controller.uploadFile(),
            icon: controller.isLoading.value
                ? const CircularProgressIndicator()
                : const Icon(Icons.upload),
            label: Text(controller.isLoading.value ? "Processing" : "Upload"),
          ),
        ),
      ),
    );
  }
}
