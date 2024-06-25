import 'package:firebase_demo/GetxTask/VideoTask/LanguageTranslate/controller_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  LanguageTranslateController languageTranslateController =
      Get.put(LanguageTranslateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hello".tr),
            ElevatedButton(
              onPressed: () {
                languageTranslateController.changeLanguage("hi", "IN");
              },
              child: const Text("hindi"),
            ),
            ElevatedButton(
              onPressed: () {
                languageTranslateController.changeLanguage("fr", "FR");
              },
              child: const Text("french"),
            ),
            ElevatedButton(
              onPressed: () {
                languageTranslateController.changeLanguage("en", "US");
              },
              child: const Text("english"),
            ),
          ],
        ),
      ),
    );
  }
}
