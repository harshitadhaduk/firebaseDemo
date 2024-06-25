import 'package:get/get.dart';

import '../../Controller/all_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CountControllerObs>(CountControllerObs());
    Get.put<CountControllerObs2>(CountControllerObs2());
  }
}
