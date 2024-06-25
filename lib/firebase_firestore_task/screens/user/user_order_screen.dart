import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/order_details_screen.dart';
import 'package:flutter/material.dart';

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({super.key});

  @override
  State<UserOrderScreen> createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> allData = [];
  List idData = [];
  bool loading = false;

  void getAllData() async {
    setState(() {
      loading = true;
    });
    var data = await firebaseFirestore
        .collection("order")
        .where("userId", isEqualTo: auth.currentUser!.uid)
        .get();

    for (var element in data.docs) {
      allData.add(element.data());
      idData.add(element.id);
    }

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
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : allData.isEmpty
                ? const Center(
                    child: Text("No Order Available"),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                    itemCount: allData.length,
                    itemBuilder: (context, index) {
                      var getData = allData[index];
                      return InkResponse(
                        onTap: () {
                          print("${idData[index]}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetailsScreen(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Name : ${getData["name"]}"),
                              Text("Price :  ${getData["price"]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        // child: FutureBuilder(
        //   future: firebaseFirestore
        //       .collection("order")
        //       .where("userId", isEqualTo: userId)
        //       .get(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       var data = snapshot.data!.docs;
        //       if (snapshot.data!.docs.isNotEmpty) {
        //         return ListView.builder(
        //           padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        //           itemCount: data.length,
        //           itemBuilder: (context, index) {
        //             var getData = data[index].data();
        //             return InkResponse(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => OrderDetailsScreen(
        //                       id: data[index].id,
        //                     ),
        //                   ),
        //                 );
        //               },
        //               child: Container(
        //                 height: 0.1 * height,
        //                 width: double.infinity,
        //                 margin: EdgeInsets.symmetric(vertical: 0.01 * height),
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(0.01 * height),
        //                   border: Border.all(color: Colors.black),
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Text("Name : ${getData["name"]}"),
        //                     Text("Price :  ${getData["price"]}"),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         );
        //       } else {
        //         return const Center(
        //           child: Text("No Order Available"),
        //         );
        //       }
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),

        // child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        //   stream: firebaseFirestore
        //       .collection("userData")
        //       .doc(userId)
        //       .collection("buy")
        //       .where("isBuy", isEqualTo: false)
        //       .snapshots(),
        //   // stream: firebaseFirestore
        //   //     .collection("product")
        //   //     .where("userid", isEqualTo: userId)
        //   //     .where("is_buy", isEqualTo: true)
        //   //     .snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.data == null) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.data?.docs.isNotEmpty ?? true) {
        //       var data = snapshot.data!.docs;
        //
        //       return Padding(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 0.04 * width,
        //           vertical: 0.01 * height,
        //         ),
        //         child: GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 0.01 * height,
        //             crossAxisSpacing: 0.02 * width,
        //           ),
        //           itemCount: data.length,
        //           itemBuilder: (context, index) {
        //             var getAllData = data[index].data();
        //             var id = data[index].id;
        //             print("Data ${getAllData}");
        //
        //             return InkResponse(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => DetailsScreenFireBase(
        //                       id: id,
        //                     ),
        //                   ),
        //                 );
        //               },
        //               child: Container(
        //                 height: 0.2 * height,
        //                 width: 0.4 * width,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(0.01 * height),
        //                   border: Border.all(color: Colors.black),
        //                 ),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Text("Name : ${getAllData["name"]}"),
        //                     Text("Price : ${getAllData["price"]}"),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     } else {
        //       return const Center(child: Text("No Order Available"));
        //     }
        //   },
        // ),
      ),
    );
  }
}
