import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/ApiServices/api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  @override
  void onInit() {
    super.onInit();

    UserProvider().getUser().then((resp) {
      change(resp, status: RxStatus.success());
      print("success");
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(
          err.toString(),
        ),
      );
      print("unsuccess");
    });
  }
}
