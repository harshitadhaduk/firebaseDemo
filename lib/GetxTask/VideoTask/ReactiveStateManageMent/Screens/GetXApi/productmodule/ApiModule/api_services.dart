import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/productmodule/model/productmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/tv_model.dart';

class ApiServices {
  static var clientData = http.Client();
  static Future<List<ProductModel>?> getProductData() async {
    var response = await clientData.get(
      Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"),
    );
    // List<ProductModel>? data;
    if (response.statusCode == 200) {
      // data = productModelFromJson(response.body);
      var jsonString = response.body;
      return productModelFromJson(jsonString);
    }
    // return data;
  }
}

class ApiProvider extends GetConnect {
  String appBaseUrl = "https://www.episodate.com/api/most-popular";
  ApiProvider() {
    httpClient.baseUrl = appBaseUrl;
    httpClient.defaultContentType = "application/json";
  }

  Future<TvShowResponseModel> getTvShow(String page) async {
    try {
      final response = await get("?page=$page");
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return tvShowResponseModelFromJson(response.bodyString!);
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}

class TvShowRepository {
  final ApiProvider apiProvider;
  TvShowRepository(this.apiProvider);

  Future<TvShowResponseModel> getTvShow(String page) =>
      apiProvider.getTvShow(page);
}
