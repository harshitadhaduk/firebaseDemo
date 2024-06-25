import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class DependenciesScreen extends StatefulWidget {
  const DependenciesScreen({super.key});

  @override
  State<DependenciesScreen> createState() => _DependenciesScreenState();
}

class _DependenciesScreenState extends State<DependenciesScreen> {
  @override
  Widget build(BuildContext context) {
    //permanent
    // DependenciesController dependenciesController =
    //     Get.put(DependenciesController(), permanent: true, tag: "first");

    //created but not initialise and not use only memory allocated
    // same as permanent but fenix recreate the instance
    //Get.lazyPut(() => DependenciesController(),tag: "second",fenix: true);

    // multiple controller use
    // Get.create<DependenciesController>(() => DependenciesController());
    Get.putAsync<DependenciesController>(() async => DependenciesController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkResponse(
              onTap: () {
                //with tag
                // Get.find<DependenciesController>(tag: "first");

                //after created
                //  Get.find<DependenciesController>();

                //Get.find<DependenciesController>();
                Get.find<DependenciesController>().incrementCounter();
              },
              child: const Text("Tap"),
            ),
          ],
        ),
      ),
    );
  }
}
