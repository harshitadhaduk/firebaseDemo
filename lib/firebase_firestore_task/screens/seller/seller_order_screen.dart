import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/seller/seller_order_details_screen.dart';
import 'package:flutter/material.dart';

class SellerOrderScreen extends StatefulWidget {
  const SellerOrderScreen({super.key});

  @override
  State<SellerOrderScreen> createState() => _SellerOrderScreenState();
}

class _SellerOrderScreenState extends State<SellerOrderScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> data = [];
  List idData = [];
  bool loading = false;

  void getAllData() async {
    setState(() {
      loading = true;
    });
    var getData = await firebaseFirestore
        .collection("order")
        .where("sellerId", isEqualTo: auth.currentUser!.uid)
        .get();

    for (var element in getData.docs) {
      data.add(element.data());
      idData.add(element.id);
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.01 * height),
              child: const Text(
                "Order",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 0.5 * height,
              width: double.infinity,
              child: ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                itemBuilder: (context, index) {
                  var getData = data[index];
                  return InkResponse(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellerOrderDetailsScreen(
                            id: idData[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 0.1 * height,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 0.01 * height),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.01 * height),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Name : ${getData["name"]}"),
                          Text("Price :${getData["price"]}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 0.8 * height,
            //   width: double.infinity,
            //   child: FutureBuilder(
            //     future: firebaseFirestore
            //         .collection("order")
            //         .where("sellerId", isEqualTo: userId)
            //         .get(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         var data = snapshot.data!.docs;
            //         if (snapshot.data!.docs.isNotEmpty) {
            //           return SizedBox(
            //             height: 0.5 * height,
            //             width: double.infinity,
            //             child: ListView.builder(
            //               itemCount: data.length,
            //               padding:
            //                   EdgeInsets.symmetric(horizontal: 0.04 * width),
            //               itemBuilder: (context, index) {
            //                 var getData = data[index].data();
            //                 return InkResponse(
            //                   onTap: () {
            //                     Navigator.push(
            //                       context,
            //                       MaterialPageRoute(
            //                         builder: (context) =>
            //                             SellerOrderDetailsScreen(
            //                           id: data[index].id,
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                   child: Container(
            //                     height: 0.1 * height,
            //                     width: double.infinity,
            //                     margin: EdgeInsets.symmetric(
            //                         vertical: 0.01 * height),
            //                     decoration: BoxDecoration(
            //                       borderRadius:
            //                           BorderRadius.circular(0.01 * height),
            //                       border: Border.all(color: Colors.black),
            //                     ),
            //                     child: Column(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceEvenly,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: [
            //                         Text("Name : ${getData["name"]}"),
            //                         Text("Price :${getData["price"]}"),
            //                       ],
            //                     ),
            //                   ),
            //                 );
            //               },
            //             ),
            //           );
            //         } else {
            //           return const Center(
            //             child: Text("No Order Available"),
            //           );
            //         }
            //       } else {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
