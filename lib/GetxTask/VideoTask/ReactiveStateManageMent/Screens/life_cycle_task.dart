import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class LifeCycleTaskDemo extends StatefulWidget {
  const LifeCycleTaskDemo({super.key});

  @override
  State<LifeCycleTaskDemo> createState() => _LifeCycleTaskDemoState();
}

class _LifeCycleTaskDemoState extends State<LifeCycleTaskDemo> {
  LifeCycleController lifeCycleController = Get.put(LifeCycleController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Life Cycle"),
            GetBuilder<LifeCycleController>(
              initState: (data) => lifeCycleController.increment(),
              dispose: (_) => lifeCycleController.dispose(),
              builder: (controller) {
                print("${lifeCycleController.count}");
                return Text("${lifeCycleController.count}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
