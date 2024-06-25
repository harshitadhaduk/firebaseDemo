import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  static String allData = "allData";

  static writeData(String value, String key) async {
    await getStorage.write(key, value);
  }

  static readData(String key) {
    return getStorage.read(key);
  }

  static removeData(String key) {
    return getStorage.remove(key);
  }

  static clearData() {
    return getStorage.erase();
  }
}
