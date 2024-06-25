import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeechToTextScreen extends GetView<SpeechToTextController> {
  const SpeechToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SpeechToTextController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => AvatarGlow(
          glowShape: BoxShape.circle,
          animate: controller.isListening.value,
          glowColor: Colors.blue,
          duration: const Duration(milliseconds: 2000),
          repeat: true,
          // glowBorderRadius: BorderRadius.circular(90),
          child: FloatingActionButton(
            onPressed: () {
              controller.listen();
            },
            child: Icon(
              controller.isListening.value ? Icons.mic : Icons.mic_none,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                Obx(
                  () => Text(controller.speechText.value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
