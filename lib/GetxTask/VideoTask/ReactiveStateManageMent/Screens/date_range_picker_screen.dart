import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateRangePickerScreen extends GetView<DateRangeController> {
  const DateRangePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DateRangeController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Start : ${DateFormat("dd-MM-yyyy").format(controller.dateRange.value.start)}",
              ),
            ),
            Obx(
              () => Text(
                "End : ${DateFormat("dd-MM-yyyy").format(controller.dateRange.value.end)}",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.chooseDateRange();
              },
              child: const Text("Click Here"),
            ),
          ],
        ),
      ),
    );
  }
}
