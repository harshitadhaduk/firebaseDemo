import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  static String userId = "userId";
  static String userEmail = "userEmail";
  static String registerEmail = "registerEmail";
  static String multiTaskUserEmail = "multiTaskUserEmail";
  static String multiTaskUserMobile = "multiTaskUserMobile";
  static String multiTaskRegisterEmail = "multiTaskRegisterEmail";
  static String userIdF = "userIdF";
  static String userEmailF = "userEmailF";
  static String mobileName = "mobileName";
  static String userType = "userType";

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
