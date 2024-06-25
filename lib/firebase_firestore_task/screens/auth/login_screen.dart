import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';

class LoginScreenFireBase extends StatefulWidget {
  const LoginScreenFireBase({super.key});

  @override
  State<LoginScreenFireBase> createState() => _LoginScreenFireBaseState();
}

class _LoginScreenFireBaseState extends State<LoginScreenFireBase> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool loading = false;
  List typeOfUser = ["User", "Seller"];
  var selectUser;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential user =
                        await firebaseAuth.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    PreferenceManager.writeData(
                        user.user!.uid, PreferenceManager.userIdF);
                    PreferenceManager.writeData(
                        emailController.text, PreferenceManager.userEmailF);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarScreenFirBase(
                          userType: "$selectUser",
                        ),
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
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
