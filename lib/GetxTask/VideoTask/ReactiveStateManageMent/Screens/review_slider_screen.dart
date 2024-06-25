import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reviews_slider/reviews_slider.dart';

class ReviewSliderScreen extends GetView<ReviewController> {
  const ReviewSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Review"),
            const SizedBox(height: 10),
            ReviewSlider(
              onChange: (index) {
                controller.select.value = index;
              },
              initialValue: 0,
              optionStyle: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(controller.select.value == 0
                  ? "Terrible"
                  : controller.select.value == 1
                      ? "Bad"
                      : controller.select.value == 2
                          ? "Okay"
                          : controller.select.value == 3
                              ? "Good"
                              : controller.select.value == 4
                                  ? "Great"
                                  : "Terrible"),
            ),
          ],
        ),
      ),
    );
  }
}
