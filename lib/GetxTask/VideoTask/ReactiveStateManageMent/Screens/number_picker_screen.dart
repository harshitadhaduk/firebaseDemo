import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerScreen extends GetView<NumberController> {
  const NumberPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NumberController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => NumberPicker(
                minValue: 18,
                maxValue: 100,
                value: controller.currentNumber.value,
                onChanged: (value) {
                  controller.currentNumber.value = value;
                },
                selectedTextStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurple,
                ),
                axis: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text("Current value : ${controller.currentNumber.value}"),
            ),
          ],
        ),
      ),
    );
  }
}
