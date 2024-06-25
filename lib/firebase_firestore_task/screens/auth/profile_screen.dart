import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/preferenceManager/preference_manager.dart';
import 'package:flutter/material.dart';

class ProfileScreenFireBase extends StatefulWidget {
  const ProfileScreenFireBase({super.key});

  @override
  State<ProfileScreenFireBase> createState() => _ProfileScreenFireBaseState();
}

class _ProfileScreenFireBaseState extends State<ProfileScreenFireBase> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<Map<String, dynamic>> allData = [];

  bool loading = false;
  var userID = PreferenceManager.readData(PreferenceManager.userIdF);

  void getAllData() async {
    setState(() {
      loading = true;
    });
    var data = await firebaseFirestore.collection("userData").doc(userID).get();
    allData.add(data.data() as Map<String, dynamic>);
    print("$data");

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (allData.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      firstNameController.text = "${allData[0]["first name"]}";
      lastNameController.text = "${allData[0]["last name"]}";
      mobileNoController.text = "${allData[0]["mobile no"]}";
      emailController.text = "${allData[0]["email"]}";
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: mobileNoController,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      firebaseFirestore
                          .collection("userData")
                          .doc("$userID")
                          .update({
                        "first name": firstNameController.text,
                        "last name": lastNameController.text,
                        "mobile no": mobileNoController.text,
                        "email": emailController.text,
                      });

                      PreferenceManager.writeData(
                          emailController.text, PreferenceManager.userEmailF);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Update Successfully"),
                        ),
                      );
                    },
                    child: const Text("update"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      PreferenceManager.clearData();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Log Out Successfully")));
                    },
                    child: const Text("Log Out"),
                  ),
                ],
              ),
            ),
            // child: FutureBuilder(
            //   future: firebaseFirestore.collection("userData").doc(userID).get(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       Map<String, dynamic>? data = snapshot.data!.data();
            //
            //       firstNameController.text = "${data!["first name"]}";
            //       lastNameController.text = "${data["last name"]}";
            //       mobileNoController.text = "${data["mobile no"]}";
            //       emailController.text = "${data["email"]}";
            //       print("Data $data");
            //
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 20,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             TextFormField(
            //               keyboardType: TextInputType.name,
            //               controller: firstNameController,
            //               decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 10),
            //             TextFormField(
            //               keyboardType: TextInputType.name,
            //               controller: lastNameController,
            //               decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 10),
            //             TextFormField(
            //               maxLength: 10,
            //               keyboardType: TextInputType.phone,
            //               controller: mobileNoController,
            //               decoration: InputDecoration(
            //                 counterText: "",
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 10),
            //             TextFormField(
            //               keyboardType: TextInputType.emailAddress,
            //               controller: emailController,
            //               decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //               ),
            //             ),
            //             const SizedBox(height: 10),
            //             ElevatedButton(
            //               onPressed: () {
            //                 firebaseFirestore
            //                     .collection("userData")
            //                     .doc("$userID")
            //                     .update({
            //                   "first name": firstNameController.text,
            //                   "last name": lastNameController.text,
            //                   "mobile no": mobileNoController.text,
            //                   "email": emailController.text,
            //                 });
            //
            //                 PreferenceManager.writeData(emailController.text,
            //                     PreferenceManager.userEmailF);
            //
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                   const SnackBar(
            //                     content: Text("Update Successfully"),
            //                   ),
            //                 );
            //               },
            //               child: const Text("update"),
            //             ),
            //             const SizedBox(height: 10),
            //             ElevatedButton(
            //               onPressed: () {
            //                 PreferenceManager.clearData();
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                     const SnackBar(
            //                         content: Text("Log Out Successfully")));
            //               },
            //               child: const Text("Log Out"),
            //             ),
            //           ],
            //         ),
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          ),
        ),
      );
    }
  }
}
