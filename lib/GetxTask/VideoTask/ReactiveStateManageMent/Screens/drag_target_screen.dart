import 'package:flutter/material.dart';

class DragTargetScreen extends StatelessWidget {
  const DragTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool condition = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag Target Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Draggable(
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              childWhenDragging: Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              axis: Axis.vertical,
              onDragStarted: () {},
              onDragCompleted: () {},
              onDragEnd: (details) {},
              onDraggableCanceled: (velocity, offset) {},
              onDragUpdate: (details) {},
              maxSimultaneousDrags: 1,
              data: "Demo",
              child: Container(
                height: 100,
                width: 100,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            DragTarget(
              builder: (context, candidateData, rejectedData) {
                return condition
                    ? Container(height: 100, width: 100, color: Colors.red)
                    : Container(height: 100, width: 100, color: Colors.black);
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                condition = true;
              },
            )
          ],
        ),
      ),
    );
  }
}
