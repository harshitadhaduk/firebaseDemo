import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/task/screens/multi_task/multi_task_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:async';
import '../../../preferenceManager/preference_manager.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.mobileNo, this.id, this.token});
  final mobileNo;
  final id;
  final token;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var verifyCode;
  bool loading = false;
  int second = 60;

  void timer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        second--;
        if (second == 0) {
          timer.cancel();
        } else if (second == -1) {
          second = 60;
          timer.isActive;
        }
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 0.4 * height),
              Text(
                "${widget.mobileNo}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 0.045 * width,
                ),
              ),
              SizedBox(height: 0.02 * height),
              OtpTextField(
                numberOfFields: 6,
                borderColor: Colors.black,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  verifyCode = verificationCode;
                }, // end onSubmit
              ),
              SizedBox(height: 0.02 * height),
              Text(
                "Reset Otp $second Second",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 0.04 * width,
                ),
              ),
              SizedBox(height: 0.01 * height),
              second == 0
                  ? ElevatedButton(
                      onPressed: () {
                        timer();

                        setState(() {
                          loading = true;
                        });
                        auth.verifyPhoneNumber(
                          phoneNumber: "${widget.mobileNo}",
                          verificationCompleted: (phoneAuthCredential) {
                            setState(() {
                              loading = false;
                            });
                          },
                          verificationFailed: (error) {
                            setState(() {
                              loading = false;
                            });
                            print("Unsuccessful");
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            setState(() {
                              loading = false;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                          forceResendingToken: widget.token,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        fixedSize: Size(0.4 * width, 0.055 * height),
                      ),
                      child: Text(
                        "Reset OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.045 * width,
                        ),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(height: 0.02 * height),
              ElevatedButton(
                onPressed: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: "${widget.id}",
                    smsCode: "$verifyCode",
                  );

                  UserCredential userCredential =
                      await auth.signInWithCredential(credential);

                  PreferenceManager.writeData("${widget.mobileNo}",
                      PreferenceManager.multiTaskUserMobile);

                  var userdata = PreferenceManager.readData(
                      PreferenceManager.multiTaskUserMobile);

                  print("GET STORAGE USER $userdata");

                  print("USER ${userCredential.user!.uid}");
                  print("USER ${userCredential.user!.phoneNumber}");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiTaskHomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                  fixedSize: Size(0.6 * width, 0.065 * height),
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "Verify OTP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.04 * width,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
