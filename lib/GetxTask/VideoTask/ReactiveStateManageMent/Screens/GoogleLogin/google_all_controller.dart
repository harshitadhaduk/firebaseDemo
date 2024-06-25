import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHomeController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onReady() async {
    googleSignIn = GoogleSignIn();
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });
    super.onReady();
  }

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed("/gwelcome", arguments: firebaseAuth.currentUser);
    } else {
      Get.offAllNamed("/glogin");
    }
  }
}

class GoogleLoginController extends GetxController {
  GoogleHomeController homeController = Get.find<GoogleHomeController>();

  void login() async {
    CustomFullDialogScreen.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await homeController.googleSignIn.signIn();
    if (googleSignInAccount == null) {
      CustomFullDialogScreen.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullDialogScreen.cancelDialog();
    }
  }
}

class GoogleWelcomeController extends GetxController {
  GoogleHomeController homeController = Get.find<GoogleHomeController>();
  late User user;
  @override
  void onInit() async {
    super.onInit();
    user = Get.arguments;
  }

  void logout() async {
    await homeController.googleSignIn.disconnect();
    await homeController.firebaseAuth.signOut();
  }
}

class CustomFullDialogScreen {
  static void showDialog() {
    Get.dialog(
      WillPopScope(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.3),
      useSafeArea: true,
    );
  }

  static void cancelDialog() {
    Get.back();
  }
}

class GoogleHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoogleHomeController>(GoogleHomeController());
  }
}

class GoogleLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoogleLoginController>(GoogleLoginController());
  }
}

class GoogleWelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GoogleWelcomeController>(GoogleWelcomeController());
  }
}
