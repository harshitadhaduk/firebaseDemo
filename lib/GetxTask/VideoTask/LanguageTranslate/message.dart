import 'package:get/get.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "hello": "hello",
        },
        "hi_IN": {
          "hello": "नमस्ते",
        },
        "fr_FR": {
          "hello": "Bonjour",
        }
      };
}
