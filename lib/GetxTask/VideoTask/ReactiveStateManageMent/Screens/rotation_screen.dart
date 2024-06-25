import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class RotationScreen extends GetView<RotationController> {
  const RotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RotationController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(controller.animationController),
              child: Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/Images/trees.webp"),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.startAnimation();
              },
              child: Obx(
                () => Text(
                  controller.isAnimating.value ? "stop" : "start",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
