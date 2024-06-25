import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/task/screens/multi_task/multi_task_home_screen.dart';
import 'package:flutter/material.dart';
import '../../../preferenceManager/preference_manager.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: 0.03 * height),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkResponse(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.27 * height),
                    TextFormField(
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(height: 0.02 * height),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        bool validEmail = RegExp(
                                "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                            .hasMatch(value!);
                        if (validEmail) {
                          return null;
                        } else {
                          return "please enter strong password";
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        prefixIcon: const Icon(
                          Icons.remove_red_eye,
                        ),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(height: 0.02 * height),
                    loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  setState(() {
                                    loading = true;
                                  });

                                  try {
                                    UserCredential credential = await auth
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);

                                    PreferenceManager.writeData(
                                        emailController.text,
                                        PreferenceManager.multiTaskUserEmail);
                                    var userId = PreferenceManager.readData(
                                        PreferenceManager.multiTaskUserEmail);
                                    print("GET STORAGE USER $userId");

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MultiTaskHomeScreen(),
                                      ),
                                    );

                                    print("USER ${credential.user!.uid}");
                                    print("USER ${credential.user!.email}");

                                    setState(() {
                                      loading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(e.code);
                                    setState(
                                      () {
                                        loading = false;
                                      },
                                    );

                                    String msg = "";

                                    if (e.code == "email-already-in-use") {
                                      msg = "Please enter another Email";
                                    } else if (e.code == "invalid-email") {
                                      msg = "Please enter correct Email";
                                    } else if (e.code == "channel-error") {
                                      msg = "Please try Again";
                                    } else if (e.code == "weak-password") {
                                      msg = "Please enter Strong Password";
                                    } else {
                                      msg = "Please try Again";
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(msg),
                                      ),
                                    );
                                  }
                                } else if (emailController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please Enter Email"),
                                    ),
                                  );
                                } else if (passwordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please Enter Password"),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(0.8 * width, 0.065 * height),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.01 * height),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 0.045 * width,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
