import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StrongPasswordScreen extends GetView<StrongPasswordController> {
  const StrongPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StrongPasswordController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  controller.checkPasswordStrength(value);
                },
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
              ),
              const SizedBox(height: 20),
              Obx(
                () => LinearProgressIndicator(
                  value: controller.passwordStrength.value,
                  backgroundColor: Colors.grey,
                  color: controller.passwordStrength.value <= 1 / 4
                      ? Colors.teal
                      : controller.passwordStrength.value == 2 / 4
                          ? Colors.pink.shade200
                          : controller.passwordStrength.value == 3 / 4
                              ? Colors.deepPurpleAccent
                              : Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => Text(controller.displayText.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
