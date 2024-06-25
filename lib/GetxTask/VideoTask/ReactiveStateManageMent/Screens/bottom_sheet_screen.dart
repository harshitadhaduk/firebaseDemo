import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetScreen extends GetView<BottomSheetController> {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomSheetController());
    return Scaffold(
      body: ExpandableBottomSheet(
        key: controller.globalKey,
        enableToggle: true,
        animationCurveContract: Curves.ease,
        animationCurveExpand: Curves.bounceOut,
        background: Container(
          color: Colors.pink.shade100,
          child: Center(
            child: Obx(
              () => Text(
                "Background-${controller.expansionStatus.value}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        expandableContent: Container(
          height: 500,
          color: Colors.green.shade100,
          child: const Center(
            child: Text(
              "Content",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        persistentHeader: Container(
          color: Colors.blue.shade100,
          height: 40,
          child: const Center(
            child: Text(
              "Header",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        persistentFooter: Container(
          color: Colors.teal.shade200,
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  controller.globalKey.currentState!.expand();
                },
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.expansionStatus.value =
                      controller.globalKey.currentState!.expansionStatus;
                },
                icon: const Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.globalKey.currentState!.contract();
                },
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
