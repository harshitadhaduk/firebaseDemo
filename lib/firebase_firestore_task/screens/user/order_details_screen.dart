import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/chat_screen.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String? id;
  const OrderDetailsScreen({super.key, this.id});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> allData = [];

  bool loading = false;

  void getAllData() async {
    setState(() {
      loading = true;
    });
    var data =
        await firebaseFirestore.collection("order").doc("${widget.id}").get();
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04 * width),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.06 * height),
                  InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        child: Icon(
                          Icons.arrow_back,
                          size: 0.04 * height,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01 * height),
                  Text("Name : ${allData[0]["name"]}"),
                  SizedBox(height: 0.01 * height),
                  Text("Price : ${allData[0]["price"]}"),
                  SizedBox(height: 0.01 * height),
                  Text("Discount : ${allData[0]["discount"]}"),
                  SizedBox(height: 0.01 * height),
                  Text("Description : ${allData[0]["description"]}"),
                  SizedBox(height: 0.04 * height),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            productId: widget.id,
                            sellerid: allData[0]["sellerId"],
                            userid: auth.currentUser!.uid,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      "Chat with Owner",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 0.02 * height,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01 * height),
                  const Divider(),
                  SizedBox(height: 0.03 * height),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.065 * width,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.03 * height),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 0.03 * height,
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                      SizedBox(width: 0.02 * width),
                      const Text("Confirmed Order"),
                    ],
                  ),
                  SizedBox(height: 0.03 * height),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 0.03 * height,
                        child: const Icon(Icons.settings),
                      ),
                      SizedBox(width: 0.02 * width),
                      const Text("Processing Order"),
                    ],
                  ),
                  SizedBox(height: 0.03 * height),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 0.03 * height,
                        child: const Icon(Icons.workspace_premium_outlined),
                      ),
                      SizedBox(width: 0.02 * width),
                      const Text("Quality Check"),
                    ],
                  ),
                  SizedBox(height: 0.03 * height),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 0.03 * height,
                        child: const Icon(Icons.car_crash),
                      ),
                      SizedBox(width: 0.02 * width),
                      const Text("Product Dispatched"),
                    ],
                  ),
                  SizedBox(height: 0.03 * height),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 0.03 * height,
                        child: const Icon(Icons.home),
                      ),
                      SizedBox(width: 0.02 * width),
                      const Text("Product Delivered"),
                    ],
                  ),
                ],
              ),
              // child: FutureBuilder(
              //   future:
              //       firebaseFirestore.collection("order").doc("${widget.id}").get(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       var data = snapshot.data!.data();
              //
              //       return Column(
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //           SizedBox(height: 0.06 * height),
              //           InkResponse(
              //             onTap: () {
              //               Navigator.pop(context);
              //             },
              //             child: Align(
              //               alignment: Alignment.centerLeft,
              //               child: CircleAvatar(
              //                 backgroundColor: Colors.teal.shade100,
              //                 child: Icon(
              //                   Icons.arrow_back,
              //                   size: 0.04 * height,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 0.01 * height),
              //           Text("Name : ${data!["name"]}"),
              //           SizedBox(height: 0.01 * height),
              //           Text("Price : ${data["price"]}"),
              //           SizedBox(height: 0.01 * height),
              //           Text("Discount : ${data["discount"]}"),
              //           SizedBox(height: 0.01 * height),
              //           Text("Description : ${data["description"]}"),
              //           SizedBox(height: 0.04 * height),
              //           ElevatedButton(
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => ChatScreen(
              //                     productId: widget.id,
              //                     sellerid: data["sellerId"],
              //                     userid: auth.currentUser!.uid,
              //                   ),
              //                 ),
              //               );
              //             },
              //             style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.black,
              //             ),
              //             child: Text(
              //               "Chat with Owner",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 0.02 * height,
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 0.01 * height),
              //           const Divider(),
              //           SizedBox(height: 0.03 * height),
              //           Align(
              //             alignment: Alignment.centerLeft,
              //             child: Text(
              //               "Order Details",
              //               style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 0.065 * width,
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 0.03 * height),
              //           Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 0.03 * height,
              //                 child: const Icon(Icons.shopping_cart_outlined),
              //               ),
              //               SizedBox(width: 0.02 * width),
              //               const Text("Confirmed Order"),
              //             ],
              //           ),
              //           SizedBox(height: 0.03 * height),
              //           Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 0.03 * height,
              //                 child: const Icon(Icons.settings),
              //               ),
              //               SizedBox(width: 0.02 * width),
              //               const Text("Processing Order"),
              //             ],
              //           ),
              //           SizedBox(height: 0.03 * height),
              //           Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 0.03 * height,
              //                 child: const Icon(Icons.workspace_premium_outlined),
              //               ),
              //               SizedBox(width: 0.02 * width),
              //               const Text("Quality Check"),
              //             ],
              //           ),
              //           SizedBox(height: 0.03 * height),
              //           Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 0.03 * height,
              //                 child: const Icon(Icons.car_crash),
              //               ),
              //               SizedBox(width: 0.02 * width),
              //               const Text("Product Dispatched"),
              //             ],
              //           ),
              //           SizedBox(height: 0.03 * height),
              //           Row(
              //             children: [
              //               CircleAvatar(
              //                 radius: 0.03 * height,
              //                 child: const Icon(Icons.home),
              //               ),
              //               SizedBox(width: 0.02 * width),
              //               const Text("Product Delivered"),
              //             ],
              //           ),
              //         ],
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
