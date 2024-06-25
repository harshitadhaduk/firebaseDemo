import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ReDirectSplashController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("id") != null) {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAllNamed("/home");
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAllNamed("/login");
        },
      );
    }
  }
}

class ReDirectLoginController extends GetxController {
  final getStorage = GetStorage();
  login() {
    getStorage.write("id", 1);
    getStorage.write("name", "Abc");
    Get.offAllNamed("/home");
  }
}

class ReDirectHomeController extends GetxController {
  final getStorage = GetStorage();
  var name = "";

  @override
  void onInit() {
    super.onInit();
    name = getStorage.read("name");
  }

  logout() {
    getStorage.erase();
    Get.offAllNamed("/login");
  }
}

class ReDirectSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReDirectSplashController>(ReDirectSplashController());
  }
}

class ReDirectHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReDirectHomeController>(ReDirectHomeController());
  }
}

class ReDirectLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReDirectLoginController>(ReDirectLoginController());
  }
}
