import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class GetXWorkerScreen extends StatefulWidget {
  const GetXWorkerScreen({super.key});

  @override
  State<GetXWorkerScreen> createState() => _GetXWorkerScreenState();
}

class _GetXWorkerScreenState extends State<GetXWorkerScreen> {
  GetXWorkerController getXWorkerController = Get.put(GetXWorkerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Get X worker"),
            ElevatedButton(
              onPressed: () => getXWorkerController.increment(),
              child: const Text("update"),
            ),
            TextField(
              onChanged: (value) {
                getXWorkerController.increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
