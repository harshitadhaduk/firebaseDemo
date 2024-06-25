import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Home Screen",
            ),
            ElevatedButton(
              onPressed: () {
                PreferenceManager.clearData();
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
