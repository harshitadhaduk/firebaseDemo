import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlipCardScreen extends GetView<FlipController> {
  const FlipCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FlipController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
              flipOnTouch: true,
              controller: controller.flipCardController,
              front: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                color: Colors.pink.shade100,
                child: const Text("Front"),
              ),
              back: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                color: Colors.green.shade100,
                child: const Text("Back"),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.flipCardController.toggleCard();
              },
              child: const Text("Toggle"),
            ),
          ],
        ),
      ),
    );
  }
}
