import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerScreen extends GetView<DatePickerController> {
  const DatePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DatePickerController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                DateFormat("dd-MM-yyyy")
                    .format(controller.selectDate.value)
                    .toString(),
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.chooseDate();
              },
              child: const Text("Select Date"),
            ),
          ],
        ),
      ),
    );
  }
}
