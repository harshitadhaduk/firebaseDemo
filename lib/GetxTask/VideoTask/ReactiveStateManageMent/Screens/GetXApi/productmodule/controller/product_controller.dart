import 'package:get/get.dart';
import '../ApiModule/api_services.dart';
import '../model/productmodel.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<ProductModel> productList = [];

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await ApiServices.getProductData();
      if (products != null) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
