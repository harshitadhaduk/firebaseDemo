import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelectDropDownScreen extends GetView<MultiSelectDropdownController> {
  const MultiSelectDropDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MultiSelectDropdownController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DropDownMultiSelect(
                  selectedValues: controller.selectOptionList.value,
                  options: controller.options,
                  //whenEmpty: "select state management library",
                  onChanged: (value) {
                    controller.selectOptionList.value = value;
                    controller.selectOption.value = "";
                    for (var element in controller.selectOptionList.value) {
                      controller.selectOption.value =
                          "${controller.selectOption.value}  $element";
                    }
                  },
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Text(controller.selectOption.value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
