import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataScreen extends GetView<AddDataController> {
  const AddDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDataController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "name",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "address",
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  controller.addEmployee(controller.nameController.text,
                      controller.addressController.text);
                },
                child: const Icon(Icons.add),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.employees.value[index].name),
                        subtitle:
                            Text(controller.employees.value[index].address),
                        trailing: GestureDetector(
                          onTap: () {
                            controller.removeEmployee(index);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
