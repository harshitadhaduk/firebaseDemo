import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleDemo extends StatefulWidget {
  const GoogleDemo({super.key});

  @override
  State<GoogleDemo> createState() => _GoogleDemoState();
}

class _GoogleDemoState extends State<GoogleDemo> {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  GoogleSignInAccount? googleSignInAccount =
                      await googleSignIn.signIn();

                  GoogleSignInAuthentication authentication =
                      await googleSignInAccount!.authentication;

                  OAuthCredential oAuthCredentials =
                      GoogleAuthProvider.credential(
                    idToken: authentication.idToken,
                    accessToken: authentication.accessToken,
                  );

                  UserCredential usersData =
                      await auth.signInWithCredential(oAuthCredentials);

                  print("UID ${usersData.user!.uid}");
                  print("UID ${usersData.user!.email}");
                  print("UID ${usersData.user!.photoURL}");
                  print("UID ${usersData.user!.phoneNumber}");
                },
                child: const Text("Google Login"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await googleSignIn.signOut();
                },
                child: const Text("Log Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
