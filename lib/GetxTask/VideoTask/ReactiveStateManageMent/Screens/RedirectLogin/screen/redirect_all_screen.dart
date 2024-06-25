import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/all_controller.dart';

class ReDirectSplashScreen extends GetView<ReDirectSplashController> {
  const ReDirectSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "SplashScreen is working",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ReDirectLoginScreen extends GetView<ReDirectLoginController> {
  const ReDirectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.login();
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

class ReDirectHomeScreen extends GetView<ReDirectHomeController> {
  const ReDirectHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
