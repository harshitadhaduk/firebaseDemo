import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/auth/login_screen.dart';

import 'package:firebase_demo/firebase_firestore_task/screens/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';

class RegisterScreenFireBase extends StatefulWidget {
  const RegisterScreenFireBase({super.key});

  @override
  State<RegisterScreenFireBase> createState() => _RegisterScreenFireBaseState();
}

class _RegisterScreenFireBaseState extends State<RegisterScreenFireBase> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool loading = false;
  List typeOfUser = ["User", "Seller"];
  var selectUser;

  @override
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 0.04 * height),
                    SizedBox(
                      width: double.infinity,
                      height: 0.07 * height,
                      child: DropdownButton(
                        value: selectUser,
                        isExpanded: true,
                        hint: const Text(
                          "Select Type Of User",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        items: List.generate(
                          typeOfUser.length,
                          (index) => DropdownMenuItem(
                            value: typeOfUser[index],
                            child: Text("${typeOfUser[index]}"),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectUser = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: firstNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "First Name",
                      ),
                      validator: (value) {
                        bool validFirstName =
                            RegExp("[a-zA-Z]").hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Valid First Name";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: lastNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "Last Name",
                      ),
                      validator: (value) {
                        bool validFirstName =
                            RegExp("[a-zA-Z]").hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Valid Last Name";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      controller: mobileNoController,
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "Mobile Number",
                      ),
                      validator: (value) {
                        bool validFirstName =
                            RegExp("(^(?:[+0]9)?[0-9]{10,12}\$)")
                                .hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Valid Mobile Number";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "Email",
                      ),
                      validator: (value) {
                        bool validFirstName = RegExp(
                                "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Valid Email Id";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "Password",
                      ),
                      validator: (value) {
                        bool validFirstName = RegExp(
                                "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                            .hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Strong Password";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        labelText: "Confirm Password",
                      ),
                      validator: (value) {
                        bool validFirstName = RegExp(
                                "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$")
                            .hasMatch(value!);
                        if (validFirstName) {
                          return null;
                        } else {
                          return "Please Enter Strong Password";
                        }
                      },
                    ),
                    SizedBox(height: 0.01 * height),
                    loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (passwordController.text ==
                                        confirmPasswordController.text &&
                                    selectUser != null) {
                                  setState(() {
                                    loading = true;
                                  });

                                  try {
                                    UserCredential userCredential = await auth
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);

                                    PreferenceManager.writeData(
                                        emailController.text,
                                        PreferenceManager.userEmailF);

                                    PreferenceManager.writeData(
                                        userCredential.user!.uid,
                                        PreferenceManager.userIdF);

                                    print(
                                        "FIREBASE ${userCredential.user!.uid}");
                                    print(
                                        "FIREBASE ${userCredential.user!.email}");

                                    firebaseFirestore
                                        .collection("userData")
                                        .doc(userCredential.user!.uid)
                                        .set({
                                      "userid": userCredential.user!.uid,
                                      "user type": selectUser,
                                      "first name": firstNameController.text,
                                      "last name": lastNameController.text,
                                      "mobile no": mobileNoController.text,
                                      "email": emailController.text,
                                    });

                                    setState(() {
                                      loading = false;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Login Successful"),
                                      ),
                                    );

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigationBarScreenFirBase(
                                          userType: "$selectUser",
                                        ),
                                      ),
                                    );
                                  } on FirebaseAuthException catch (e) {
                                    setState(() {
                                      loading = false;
                                    });
                                    print(e.code);

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
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("Please enter same password"),
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              fixedSize: Size(0.8 * width, 0.065 * height),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                    SizedBox(height: 0.01 * height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have Account? "),
                        InkResponse(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenFireBase(),
                              ),
                            );
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
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
