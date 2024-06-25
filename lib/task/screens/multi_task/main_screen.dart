import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:firebase_demo/task/screens/multi_task/email_register_screen.dart';
import 'package:firebase_demo/task/screens/multi_task/email_screen.dart';
import 'package:firebase_demo/task/screens/multi_task/multi_task_home_screen.dart';
import 'package:firebase_demo/task/screens/multi_task/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreenDemo extends StatefulWidget {
  const MainScreenDemo({super.key});

  @override
  State<MainScreenDemo> createState() => _MainScreenDemoState();
}

class _MainScreenDemoState extends State<MainScreenDemo> {
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn();
  TextEditingController mobileNo = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var code;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 0.3 * height),
                  Text(
                    "Welcome to the\nApp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 0.065 * width,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 0.02 * height),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      bool validNo = RegExp(
                              "^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}\$")
                          .hasMatch(value!);
                      if (validNo) {
                        return null;
                      } else {
                        return "please enter number";
                      }
                    },
                    controller: mobileNo,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Mobile Number",
                      prefixIcon: CountryCodePicker(
                        onChanged: (value) {
                          code = value.dialCode;
                          print("$code");
                        },
                        initialSelection: '+33',
                        favorite: const ['+91', 'FR'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03 * height),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        auth.verifyPhoneNumber(
                          phoneNumber: "$code ${mobileNo.text}",
                          verificationCompleted: (phoneAuthCredential) {
                            setState(() {
                              loading = true;
                            });
                            print("Successful");
                          },
                          verificationFailed: (error) {
                            setState(() {
                              loading = false;
                            });
                            print(error.code);
                            print("unsuccessful");
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 0.02 * height,
                                      horizontal: 0.02 * width,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Please enter another mobile number",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 0.045 * width,
                                          ),
                                        ),
                                        SizedBox(height: 0.01 * height),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 0.035 * width,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            setState(() {
                              loading = false;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                  mobileNo: "$code ${mobileNo.text}",
                                  id: verificationId,
                                  token: forceResendingToken,
                                ),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(0.8 * width, 0.065 * height),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.01 * height),
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.1 * height),
                  Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 0.05 * width,
                    ),
                  ),
                  SizedBox(height: 0.02 * height),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(0.8 * width, 0.065 * height),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.01 * height),
                      ),
                    ),
                    child: const Text(
                      "Continue with E-mail",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01 * height),
                  ElevatedButton(
                    onPressed: () async {
                      GoogleSignInAccount? signIn = await googleSignIn.signIn();

                      GoogleSignInAuthentication authentication =
                          await signIn!.authentication;

                      OAuthCredential credential =
                          GoogleAuthProvider.credential(
                              idToken: authentication.idToken,
                              accessToken: authentication.accessToken);

                      UserCredential userCredential =
                          await auth.signInWithCredential(credential);

                      PreferenceManager.writeData(
                          "${userCredential.user!.email}",
                          PreferenceManager.multiTaskUserEmail);

                      var userData = PreferenceManager.readData(
                          PreferenceManager.multiTaskUserEmail);

                      print("GET STORAGE USER $userData");

                      print("USER ${userCredential.user!.uid}");
                      print("USER ${userCredential.user!.email}");
                      print("USER ${userCredential.user!.photoURL}");
                      print("USER ${userCredential.user!.phoneNumber}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiTaskHomeScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size(0.8 * width, 0.065 * height),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.01 * height),
                      ),
                    ),
                    child: const Text(
                      "Continue with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01 * height),
                  Row(
                    children: [
                      Text(
                        "Do you have an account?",
                        style: TextStyle(
                          fontSize: 0.045 * width,
                        ),
                      ),
                      InkResponse(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailRegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 0.050 * width,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
