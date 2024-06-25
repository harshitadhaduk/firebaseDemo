import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/task/screens/multi_task/multi_task_home_screen.dart';
import 'package:flutter/material.dart';
import '../../../preferenceManager/preference_manager.dart';

class EmailRegisterScreen extends StatefulWidget {
  const EmailRegisterScreen({super.key});

  @override
  State<EmailRegisterScreen> createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.04 * width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  bool validEmail = RegExp(
                          "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (validEmail) {
                    return null;
                  } else {
                    return "please enter email";
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.02 * height),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  bool validEmail = RegExp(
                          "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                      .hasMatch(value!);
                  if (validEmail) {
                    return null;
                  } else {
                    return "please enter password";
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.02 * height),
              loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential user =
                              await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          PreferenceManager.writeData(emailController.text,
                              PreferenceManager.multiTaskRegisterEmail);
                          var userId = PreferenceManager.readData(
                              PreferenceManager.multiTaskRegisterEmail);
                          print("GET STORAGE USER $userId");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiTaskHomeScreen(),
                            ),
                          );

                          print("USER ${user.user!.uid}");
                          print("USER ${user.user!.email}");
                          setState(
                            () {
                              loading = false;
                            },
                          );
                        } on FirebaseAuthException catch (e) {
                          print("ERROR ${e.code}");
                          setState(() {
                            loading = false;
                          });

                          String message = '';

                          if (e.code == "invalid-credential") {
                            message = "please choose another email";
                          } else {
                            message = "please try again";
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Done",
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
