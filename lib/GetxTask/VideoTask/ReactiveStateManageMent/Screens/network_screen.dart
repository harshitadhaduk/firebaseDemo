import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class NetworkScreen extends StatelessWidget {
  NetworkScreen({super.key});

  final NetworkController networkController = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            networkController.connectionStatus.value == 1
                ? "WIFI Connected"
                : (networkController.connectionStatus.value == 2
                    ? "Mobile Internet"
                    : "No Connection"),
          ),
        ),
      ),
    );
  }
}
