import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class PasswordTextFieldScreen extends GetView<PasswordController> {
  const PasswordTextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordController());
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => TextField(
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Add",
                suffixIcon: InkWell(
                  onTap: () {
                    controller.isPasswordHidden.value =
                        !controller.isPasswordHidden.value;
                  },
                  child: controller.isPasswordHidden.value
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : const Icon(Icons.visibility_off),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
