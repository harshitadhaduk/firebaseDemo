import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class GetBuilderDemo extends StatefulWidget {
  const GetBuilderDemo({super.key});

  @override
  State<GetBuilderDemo> createState() => _GetBuilderDemoState();
}

class _GetBuilderDemoState extends State<GetBuilderDemo> {
  CountControllerSimple countControllerSimple =
      Get.put(CountControllerSimple());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Get Builder Task"),
            GetBuilder<CountControllerSimple>(
              //id compulsory
              //id: "demo",
              init: CountControllerSimple(),
              builder: (controller) {
                return Text("${countControllerSimple.count}");
                //not create on top
                //return Text("${controller.count}");
              },
            ),
            GetBuilder<CountControllerSimple>(
              init: CountControllerSimple(),
              builder: (controller) {
                return Text("${countControllerSimple.count}");
                //not create on top
                //return Text("${controller.count}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                countControllerSimple.increment();
                //not create on top
                // Get.find<CountControllerSimple>().increment();
              },
              child: const Text("update"),
            ),
          ],
        ),
      ),
    );
  }
}
