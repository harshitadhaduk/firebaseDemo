import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingDialogScreen extends GetView<RatingDialogController> {
  const RatingDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RatingDialogController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text("Your Rating : ${controller.rating.value}"),
              ),
              Obx(
                () => Text("Your Comment : ${controller.comment.value}"),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.showDialog();
                  },
                  child: const Text("Rating Dialog")),
            ],
          ),
        ),
      ),
    );
  }
}
