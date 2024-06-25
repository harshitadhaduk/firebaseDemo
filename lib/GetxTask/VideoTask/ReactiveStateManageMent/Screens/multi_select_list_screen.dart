import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class MultiSelectListScreen extends GetView<MultiSelectListController> {
  const MultiSelectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MultiSelectListController());
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.list.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                controller.list[index].isSelected.value =
                    !controller.list[index].isSelected.value;
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: controller.list[index].isSelected.value
                      ? Colors.green.shade100
                      : Colors.pink.shade100,
                ),
                child: Center(
                  child: Text(
                    "Employee ${controller.list[index].name}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
