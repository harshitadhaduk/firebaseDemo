import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DragTargetScreen2 extends GetView<DragTargetController> {
  const DragTargetScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DragTargetController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => Stack(
                children: controller.number.isEmpty
                    ? [buildDraggableWithNoItems()]
                    : controller.number
                        .map((num) => Draggable(
                            data: num,
                            feedback: buildDraggable(
                              num.toString(),
                            ),
                            childWhenDragging: const SizedBox(
                              height: 100,
                              width: 100,
                            ),
                            child: buildDraggable(
                              num.toString(),
                            )))
                        .toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDragTarget(
                  text: "Even",
                  color: Colors.lightBlue,
                  acceptType: 1,
                ),
                buildDragTarget(
                  text: "Odd",
                  color: Colors.deepPurple,
                  acceptType: 0,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => controller.restartGame(),
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDraggableWithNoItems() => Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        color: Colors.black,
        child: const Text(
          "No Item",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );

  Widget buildDraggable(String text) => Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        color: Colors.red,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );

  Widget buildDragTarget({
    required String text,
    required Color color,
    required int acceptType,
  }) =>
      DragTarget<int>(
        builder: (context, candidateData, rejectedData) => Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          color: color,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          return controller.checkController(data, acceptType);
        },
      );
}
