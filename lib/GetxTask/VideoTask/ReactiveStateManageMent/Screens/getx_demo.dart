import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class GetXDemo extends StatefulWidget {
  const GetXDemo({super.key});

  @override
  State<GetXDemo> createState() => _GetXDemoState();
}

class _GetXDemoState extends State<GetXDemo> {
  CountControllerObs countController = Get.put(CountControllerObs());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Get X Task"),
            GetX<CountControllerObs>(
              //  init: CountController(),
              builder: (controller) {
                return Text("${countController.count}");
                //  return Text("${controller.count}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                //  Get.find<CountController>().increment();
                countController.increment();
              },
              child: const Text("update"),
            ),
          ],
        ),
      ),
    );
  }
}
