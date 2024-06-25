import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({super.key});

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> allData = [];
  bool loading = false;

  void getAllData() async {
    setState(() {
      loading = true;
    });

    var data = await firebaseFirestore
        .collection("product")
        .where("userid", isEqualTo: auth.currentUser!.uid)
        .get();

    for (var element in data.docs) {
      allData.add(element.data());
    }
    print("$allData");

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
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
          itemCount: allData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.02 * width,
            mainAxisSpacing: 0.01 * height,
          ),
          itemBuilder: (context, index) {
            var data = allData[index];
            return Container(
              height: 0.2 * height,
              width: 0.4 * width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(0.01 * height),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Name : ${data["name"]}"),
                  Text("Price : ${data["price"]}"),
                  Text("Discount : ${data["discount"]}"),
                ],
              ),
            );
          },
        ),

        // child: FutureBuilder(
        //   future: firebaseFirestore
        //       .collection("product")
        //       .where("userid", isEqualTo: userId)
        //       .get(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       var data = snapshot.data!.docs;
        //       if (snapshot.data!.docs.isNotEmpty) {
        //         return GridView.builder(
        //           padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        //           itemCount: data.length,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             crossAxisSpacing: 0.02 * width,
        //             mainAxisSpacing: 0.01 * height,
        //           ),
        //           itemBuilder: (context, index) {
        //             var allData = data[index].data();
        //             return Container(
        //               height: 0.2 * height,
        //               width: 0.4 * width,
        //               decoration: BoxDecoration(
        //                 border: Border.all(color: Colors.black),
        //                 borderRadius: BorderRadius.circular(0.01 * height),
        //               ),
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                 children: [
        //                   Text("Name : ${allData["name"]}"),
        //                   Text("Price : ${allData["price"]}"),
        //                   Text("Discount : ${allData["discount"]}"),
        //                 ],
        //               ),
        //             );
        //           },
        //         );
        //       } else {
        //         return const Center(
        //           child: Text("No Data"),
        //         );
        //       }
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
