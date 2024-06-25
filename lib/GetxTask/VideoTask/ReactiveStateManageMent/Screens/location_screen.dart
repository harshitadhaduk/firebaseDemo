import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationScreen extends GetView<LocationController> {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.yellow,
              ),
              const SizedBox(height: 4),
              const Text(
                "User Location",
                style: TextStyle(color: Colors.yellow),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  controller.latitude.value,
                  style: TextStyle(color: Colors.pink.shade300),
                ),
              ),
              const SizedBox(height: 6),
              Obx(
                () => Text(
                  controller.longitude.value,
                  style: TextStyle(color: Colors.pink.shade300),
                ),
              ),
              const SizedBox(height: 6),
              Obx(
                () => Text(
                  controller.address.value,
                  style: TextStyle(color: Colors.pink.shade300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
