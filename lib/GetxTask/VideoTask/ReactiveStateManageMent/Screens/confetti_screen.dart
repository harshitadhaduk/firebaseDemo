import 'package:confetti/confetti.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfettiScreen extends GetView<ConfettiDemoController> {
  const ConfettiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConfettiDemoController());
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          body: SizedBox(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.confettiAnimation();
                },
                child: Obx(
                  () => Text(controller.isPlaying.value ? "Stop" : "Play"),
                ),
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller.controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          // blastDirection: 0,
          numberOfParticles: 20,
          gravity: 0.8,
          colors: const [
            Colors.green,
            Colors.pink,
            Colors.grey,
          ],
        ),
      ],
    );
  }
}
