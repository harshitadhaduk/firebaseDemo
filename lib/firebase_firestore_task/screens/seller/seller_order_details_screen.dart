import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../user/chat_screen.dart';

class SellerOrderDetailsScreen extends StatefulWidget {
  final id;

  const SellerOrderDetailsScreen({
    super.key,
    this.id,
  });

  @override
  State<SellerOrderDetailsScreen> createState() =>
      _SellerOrderDetailsScreenState();
}

class _SellerOrderDetailsScreenState extends State<SellerOrderDetailsScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> data = [];
  bool loading = false;

  void getData() async {
    setState(() {
      loading = true;
    });

    var getAllData =
        await firebaseFirestore.collection("order").doc("${widget.id}").get();
    data.add(getAllData.data() as Map<String, dynamic>);
    print("$data");

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: 0.1 * height),
                    Text("Name : ${data[0]["name"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Price : ${data[0]["price"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Discount : ${data[0]["discount"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Description : ${data[0]["description"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Buyer Id : ${data[0]["userId"]}"),
                    SizedBox(height: 0.01 * height),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              productId: widget.id,
                              sellerid: auth.currentUser!.uid,
                              userid: data[0]["userId"],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        "Chats",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.02 * height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        // child: FutureBuilder(
        //   future:
        //       firebaseFirestore.collection("order").doc("${widget.id}").get(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       var data = snapshot.data!.data();
        //       print("${data!["name"]}");
        //       return Center(
        //         child: Column(
        //           children: [
        //             SizedBox(height: 0.1 * height),
        //             Text("Name : ${data["name"]}"),
        //             SizedBox(height: 0.01 * height),
        //             Text("Price : ${data["price"]}"),
        //             SizedBox(height: 0.01 * height),
        //             Text("Discount : ${data["discount"]}"),
        //             SizedBox(height: 0.01 * height),
        //             Text("Description : ${data["description"]}"),
        //             SizedBox(height: 0.01 * height),
        //             Text("Buyer Id : ${data["userId"]}"),
        //             SizedBox(height: 0.01 * height),
        //             ElevatedButton(
        //               onPressed: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => ChatScreen(
        //                       productId: widget.id,
        //                       sellerid: auth.currentUser!.uid,
        //                       userid: data["userId"],
        //                     ),
        //                   ),
        //                 );
        //               },
        //               style: ElevatedButton.styleFrom(
        //                 backgroundColor: Colors.black,
        //               ),
        //               child: Text(
        //                 "Chats",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 0.02 * height,
        //                 ),
        //               ),
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
    );
  }
}
