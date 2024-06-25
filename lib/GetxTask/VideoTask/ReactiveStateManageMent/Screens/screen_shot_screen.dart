import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenShotScreen extends GetView<ScreenShotController> {
  const ScreenShotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScreenShotController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          "This page is secure",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
