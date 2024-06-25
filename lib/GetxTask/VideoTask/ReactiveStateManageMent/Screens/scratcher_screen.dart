import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';

class ScratcherScreen extends GetView<ScratchController> {
  const ScratcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScratchController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Scratcher(
              key: controller.scratchKey,
              brushSize: 20,
              threshold: 50,
              color: Colors.lightBlue,
              onChange: (value) {
                controller.scratchProgress.value = value;
              },
              onThreshold: () {
                controller.isThreshHolderReached.value = true;
              },
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset("assets/Images/trees.webp"),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(
                  "Scratch Progress ${controller.scratchProgress.value.toStringAsFixed(2)}"),
            ),
            const SizedBox(height: 5),
            Obx(
              () => Text(controller.isThreshHolderReached.value
                  ? "Threshold Reached"
                  : "Threshold not reached"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.scratchKey.currentState!.reset(
                  duration: const Duration(milliseconds: 100),
                );
                controller.isThreshHolderReached.value = false;
              },
              child: const Text("Resend"),
            ),
          ],
        ),
      ),
    );
  }
}
