import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MultiTaskHomeScreen extends StatefulWidget {
  const MultiTaskHomeScreen({super.key});

  @override
  State<MultiTaskHomeScreen> createState() => _MultiTaskHomeScreenState();
}

class _MultiTaskHomeScreenState extends State<MultiTaskHomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn signIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to\nHome Screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                PreferenceManager.clearData();
                print("Log out Successful");
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
