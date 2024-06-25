import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleMenuScreen extends GetView<CircleMenuController> {
  const CircleMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CircleMenuController());
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringColor: Colors.pink.withOpacity(0.1),
          ringDiameter: 450.0,
          ringWidth: 100.0,
          fabElevation: 8.0,
          fabColor: Colors.pink.shade200,
          fabIconBorder: const CircleBorder(),
          fabOpenIcon: const Icon(Icons.menu, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close, color: Colors.white),
          fabMargin: const EdgeInsets.all(16),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInCirc,
          onDisplayChange: (isOpen) {
            print(isOpen);
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                controller.fabKey.currentState!.close();
              },
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.pink.shade200),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.home, color: Colors.pink.shade200),
            ),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.pink.shade200),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.email, color: Colors.pink.shade200),
            ),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.pink.shade200),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.settings, color: Colors.pink.shade200),
            ),
            RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.pink.shade200),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.person, color: Colors.pink.shade200),
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Perform Action"),
        ),
      ),
    );
  }
}
