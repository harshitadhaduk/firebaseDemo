import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/AnimationDialog/Dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHomeScreen extends StatefulWidget {
  const DialogHomeScreen({super.key});

  @override
  State<DialogHomeScreen> createState() => _DialogHomeScreenState();
}

class _DialogHomeScreenState extends State<DialogHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const DialogScreen(),
                fullscreenDialog: true,
                duration: const Duration(seconds: 3),
                transition: Transition.downToUp,
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
