import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GoogleLogin/google_all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleHomeScreen extends GetView<GoogleHomeController> {
  const GoogleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );
  }
}

class GoogleLoginScreen extends GetView<GoogleLoginController> {
  const GoogleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Google Sign In"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: const Text("Sign In With Google"),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleWelcomeScreen extends GetView<GoogleWelcomeController> {
  const GoogleWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GoogleWelcomeController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("User Profile"),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            const SizedBox(height: 10),
            Text("Display name : ${controller.user.displayName}"),
            const SizedBox(height: 10),
            Text("Email : ${controller.user.email}"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
