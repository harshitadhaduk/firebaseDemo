import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConvertDataScreen extends GetView<ConvertDataController> {
  const ConvertDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ConvertDataController());
    return const Scaffold();
  }
}
