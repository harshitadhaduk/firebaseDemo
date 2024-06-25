import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class ScrollNotificationScreen extends GetView<ScrollNotificationController> {
  const ScrollNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScrollNotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll Controller/Notification"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.scrollUp();
            },
            icon: const Icon(Icons.arrow_circle_up),
          ),
          IconButton(
            onPressed: () {
              controller.scrollDown();
            },
            icon: const Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.deepPurple.shade100,
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => Text(controller.scrollMsg.value),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.orange.shade300,
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => Text(controller.scrollNotificationMsg.value),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  controller.start();
                } else if (notification is ScrollUpdateNotification) {
                  controller.updateData();
                }
                if (notification is ScrollEndNotification) {
                  controller.ended();
                }
                return true;
              },
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Item index is $index"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
