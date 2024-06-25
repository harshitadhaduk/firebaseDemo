import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReOrderableListScreen extends GetView<ReOrderableListController> {
  const ReOrderableListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReOrderableListController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ReorderableListView(
            onReorder: (oldIndex, newIndex) {
              controller.reorder(oldIndex, newIndex);
            },
            children: controller.language
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    padding: const EdgeInsets.all(16),
                    key: ValueKey(e),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.lightBlue.shade200,
                    ),
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
