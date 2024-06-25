import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/ApiServices/api.dart';
import 'package:get/get.dart';

class PopularController extends GetxController {
  var isPopular = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var isDataError = false.obs;

  void getPopular() {
    try {
      isDataProcessing(true);
      PopularProvider().getPopular().then((resp) {
        isPopular.clear();
        isDataProcessing(false);
        isPopular.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        isDataError(true);
      });
    } catch (exception) {
      isDataProcessing(false);
      isDataError(true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPopular();
  }
}
