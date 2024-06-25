import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
