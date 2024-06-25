import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraggableFabScreen extends StatelessWidget {
  const DraggableFabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ExpandableDraggableFab(
        childrenTransition: ChildrenTransition.fadeTransation,
        onTab: () {},
        distance: 20,
        initialDraggableOffset: Offset(Get.width - 90, Get.height - 100),
        childrenAlignment: Alignment.topRight,
        childrenType: ChildrenType.columnChildren,
        reverseAnimation: Curves.linear,
        curveAnimation: Curves.linear,
        enableChildrenAnimation: true,
        childrenBoxDecoration: const BoxDecoration(color: Colors.transparent),
        childrenCount: 3,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink.shade100,
            child: const Icon(Icons.audiotrack),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink.shade200,
            child: const Icon(Icons.video_call),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink.shade300,
            child: const Icon(Icons.camera),
          )
        ],
      ),
      body: const Center(
        child: Text("Expandable Draggable Fab"),
      ),
    );
  }
}
