import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionButtonScreen extends GetView<ExpansionController> {
  const ExpansionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ExpansionController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Obx(
            () => ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                controller.employeeList[panelIndex].isExpanded!.value =
                    !controller.employeeList[panelIndex].isExpanded!.value;
              },
              children: controller.employeeList.map<ExpansionPanel>(
                (ExpansionEmployee employee) {
                  return ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(employee.header!),
                      );
                    },
                    body: ListTile(title: Text(employee.body!)),
                    isExpanded: employee.isExpanded!.value,
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
