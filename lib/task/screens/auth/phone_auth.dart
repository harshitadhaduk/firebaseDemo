import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_demo/task/screens/auth/verify_otp_screen.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController mobileNo = TextEditingController();

  bool loading = false;
  final formKey = GlobalKey<FormState>();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          controller: mobileNo,
                          validator: (value) {
                            bool validNumber = RegExp(
                                    "^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}\$")
                                .hasMatch(value!);
                            if (validNumber) {
                              return null;
                            } else {
                              return "Please enter valid number";
                            }
                          },
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "Mobile No.",
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
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
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });

                              auth.verifyPhoneNumber(
                                phoneNumber: "${code} ${mobileNo.text}",
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
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 30,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                "Please Enter Another Mobile Number",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Ok"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  print("ERROR ${error.code}");
                                  print("failed");
                                },
                                codeSent:
                                    (verificationId, forceResendingToken) {
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyOtp(
                                        mobileNo: "$code ${mobileNo.text}",
                                        id: verificationId,
                                        token: forceResendingToken,
                                      ),
                                    ),
                                  );
                                },
                                codeAutoRetrievalTimeout: (verificationId) {},
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Enter Mobile Number"),
                                ),
                              );
                            }
                          },
                          child: const Text('Send OTP'),
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
