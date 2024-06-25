import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetxBinding/getx_binding_controller.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetxBinding/binding_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/all_controller.dart';

class GetXBindingScreen extends StatelessWidget {
  const GetXBindingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Binding"),
            Obx(
              () =>
                  Text("The value is ${Get.find<CountControllerObs>().count}"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.find<CountControllerObs>().increment();
              },
              child: const Text("increment"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => BindingHomeScreen(),
                );
              },
              child: const Text("Obs 2"),
            ),
          ],
        ),
      ),
    );
  }
}
