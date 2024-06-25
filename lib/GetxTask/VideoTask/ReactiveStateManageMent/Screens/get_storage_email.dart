import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmailPasswordScreen extends StatefulWidget {
  const EmailPasswordScreen({super.key});

  @override
  State<EmailPasswordScreen> createState() => _EmailPasswordScreenState();
}

class _EmailPasswordScreenState extends State<EmailPasswordScreen> {
  TextEditingController email = TextEditingController();
  GetStorage getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
            ),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(email.text)) {
                  getStorage.write("email", email.text);
                } else {
                  Get.snackbar("please", "not follow format");
                }
              },
              child: const Text("write"),
            ),
            ElevatedButton(
              onPressed: () {
                print("${getStorage.read("email")}");
              },
              child: const Text("read"),
            ),
          ],
        ),
      )),
    );
  }
}
