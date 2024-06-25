import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class DraggableScrollScreen extends GetView<DraggableScrollController> {
  const DraggableScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DraggableScrollController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Draggable Scroll Screen"),
      ),
      body: Stack(
        children: [
          Container(
            height: context.height,
            width: context.width,
            color: Colors.purple,
            child: const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Text(
                "Draggable Scrollable Sheet",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: .3,
            minChildSize: .15,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 40,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            child: Text(
                              "$index",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            "Title Position is $index",
                            style: TextStyle(
                                color: controller.selected[index]
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          selectedTileColor:
                              controller.selected[index] ? Colors.blue : null,
                          selected: controller.selected[index],
                          onTap: () => controller.selected[index] =
                              !controller.selected[index],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
