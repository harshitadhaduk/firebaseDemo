import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<List<dynamic>> getUser() async {
    final response = await get("https://randomuser.me/api/?results=10");
    if (response.status.hasError) {
      print("no");
      return Future.error(response.statusText as Object);
    } else {
      print("${response.body["results"]}");
      return response.body["results"];
    }
  }
}

class PopularProvider extends GetConnect {
  Future<List<dynamic>> getPopular() async {
    try {
      final response =
          await get("https://www.episodate.com/api/most-popular?page=1");
      if (response.status.hasError) {
        return Future.error(response.statusText as Object);
      } else {
        return response.body["tv_shows"];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
