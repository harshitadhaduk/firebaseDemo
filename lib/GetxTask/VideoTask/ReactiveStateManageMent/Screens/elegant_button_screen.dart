import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get.dart';

class ElegantNumberButtonScreen extends GetView<ElegantButtonController> {
  const ElegantNumberButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ElegantButtonController());
    return Scaffold(
      body: Center(
        child: Obx(
          () => ElegantNumberButton(
            initialValue: controller.defaultValue.value,
            minValue: 0,
            maxValue: 100,
            step: .5,
            decimalPlaces: 1,
            onChanged: (value) {
              controller.defaultValue.value = value;
            },
            color: Colors.pink.shade200,
          ),
        ),
      ),
    );
  }
}
