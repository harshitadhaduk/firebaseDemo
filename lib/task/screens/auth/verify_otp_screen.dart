import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key, this.mobileNo, this.id, this.token});
  final mobileNo;
  final id;
  final token;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool loading = false;

  String? verifyCode;
  int second = 60;
  void timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      second--;
      if (second == 0) {
        timer.cancel();
      } else if (second == -1) {
        second = 60;
        timer.isActive;
      }
      setState(() {});
    });
  }

  int count = 0;

  @override
  void initState() {
    timer();
    super.initState();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.mobileNo}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  verifyCode = verificationCode;
                }, // end onSubmit
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Reset OTP "),
                Text(
                  "$second ",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text("Seconds"),
              ],
            ),
            second == 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                      if (count < 3) {
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
                            print("success");
                          },
                          verificationFailed: (error) {
                            setState(() {
                              loading = false;
                            });
                            print("ERROR ${error.code}");
                            print("failed");
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            setState(() {
                              loading = false;
                            });
                          },
                          codeAutoRetrievalTimeout: (verificationId) {},
                          forceResendingToken: widget.token,
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Please enter another number"),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Back"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Reset OTP"),
                  )
                : const SizedBox(),
            ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential credentials = PhoneAuthProvider.credential(
                    verificationId: widget.id, smsCode: "$verifyCode");

                UserCredential usersData =
                    await auth.signInWithCredential(credentials);

                print("UID ${usersData.user!.uid}");
                print("UID ${usersData.user!.phoneNumber}");
                Navigator.pop(context);
              },
              child: const Text('verify'),
            ),
          ],
        ),
      ),
    );
  }
}
