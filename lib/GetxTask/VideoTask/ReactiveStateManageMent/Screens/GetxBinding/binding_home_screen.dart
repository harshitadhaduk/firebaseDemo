import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/all_controller.dart';

class BindingHomeScreen extends StatelessWidget {
  const BindingHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Binding Home Screen"),
            Obx(
              () =>
                  Text("The value is ${Get.find<CountControllerObs2>().count}"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerObs2>().increment();
              },
              child: const Text("increment"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
