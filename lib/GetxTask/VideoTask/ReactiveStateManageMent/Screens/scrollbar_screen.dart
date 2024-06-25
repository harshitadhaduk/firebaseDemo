import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollBarScreen extends GetView<ScrollbarController> {
  const ScrollBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScrollbarController());
    return Scaffold(
      body: RawScrollbar(
        //controller: controller.scrollController,
        thumbColor: Colors.green,
        thumbVisibility: true,
        thickness: 10,
        child: ListView.builder(
          //controller: controller.scrollController,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.deepPurple.shade100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text("$index"),
            );
          },
        ),
      ),
    );
  }
}
