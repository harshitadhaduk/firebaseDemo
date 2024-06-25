import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerScreen extends GetView<TimePickerController> {
  const TimePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimePickerController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                  "${controller.selectedTime.value.hour} : ${controller.selectedTime.value.minute}"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.chooseTime();
              },
              child: const Text("Select Time"),
            ),
          ],
        ),
      ),
    );
  }
}
