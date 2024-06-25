import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FingerPrintScreen extends GetView<FingerPrintController> {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FingerPrintController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade200,
              child: const Text(
                "Biometric",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Obx(
                    () => Icon(
                      controller.hasFingerPrintLock.value
                          ? Icons.check
                          : Icons.clear_rounded,
                      color: controller.hasFingerPrintLock.value
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Finger Print Authentication",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Obx(
                    () => controller.hasFaceLock.value
                        ? const Icon(
                            Icons.check,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.clear_rounded,
                            color: Colors.red,
                          ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Face Lock Authentication",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.authenticateUser(),
              child: const Text("Authentication"),
            ),
          ],
        ),
      ),
    );
  }
}
