import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../Controller/all_controller.dart';

class CopyPasteScreen extends StatelessWidget {
  const CopyPasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CopyPasteController controller = Get.put(CopyPasteController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: controller.textEditingController,
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(controller.text.value),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  controller.copyData(controller.textEditingController.text);
                },
                child: const Text("copy"),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.pasteData();
                },
                child: const Text("Paste"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
