import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';

class DemoStorage extends StatefulWidget {
  const DemoStorage({super.key});

  @override
  State<DemoStorage> createState() => _DemoStorageState();
}

class _DemoStorageState extends State<DemoStorage> {
  var userId;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                PreferenceManager.writeData(
                    "12345677", PreferenceManager.userId);
              },
              child: const Text("Add"),
            ),
            ElevatedButton(
              onPressed: () {
                userId = PreferenceManager.readData(PreferenceManager.userId);

                print("ID $userId");
              },
              child: const Text("Get"),
            ),
          ],
        ),
      ),
    );
  }
}
