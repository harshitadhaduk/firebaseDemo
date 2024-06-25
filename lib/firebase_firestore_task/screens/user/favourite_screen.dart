import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/details_screen_firebase.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> allData = [];
  List idData = [];
  bool loading = false;

  void getData() async {
    setState(() {
      loading = true;
    });

    var data = await firebaseFirestore
        .collection("product")
        .where("favuserid", isEqualTo: auth.currentUser!.uid)
        .where("is_favourite", isEqualTo: true)
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
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : allData.isEmpty
                ? const Center(
                    child: Text("No Favourite Product Available"),
                  )
                : GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.03 * width,
                      mainAxisSpacing: 0.01 * height,
                    ),
                    itemCount: allData.length,
                    itemBuilder: (context, index) {
                      var data2 = allData[index];
                      return InkResponse(
                        onTap: () {
                          print("${idData[index]}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreenFireBase(
                                id: idData[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 0.2 * height,
                          width: 0.4 * width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(0.01 * height),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Name : ${data2["name"]}"),
                              Text("Price : ${data2["price"]}"),
                              Text("Discount : ${data2["discount"]}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),

      // body: SafeArea(
      //   child:
      // child: FutureBuilder(
      //   future: firebaseFirestore
      //       .collection("product")
      //       .where("favuserid", isEqualTo: userId)
      //       .where("is_favourite", isEqualTo: true)
      //       .get(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var data = snapshot.data!.docs;
      //       if (snapshot.data!.docs.isNotEmpty) {
      //         return GridView.builder(
      //           padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             crossAxisSpacing: 0.03 * width,
      //             mainAxisSpacing: 0.01 * height,
      //           ),
      //           itemCount: data.length,
      //           itemBuilder: (context, index) {
      //             var data2 = data[index].data();
      //             return InkResponse(
      //               onTap: () {
      //                 Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => DetailsScreenFireBase(
      //                       id: data[index].id,
      //                     ),
      //                   ),
      //                 );
      //               },
      //               child: Container(
      //                 height: 0.2 * height,
      //                 width: 0.4 * width,
      //                 decoration: BoxDecoration(
      //                   border: Border.all(color: Colors.black),
      //                   borderRadius: BorderRadius.circular(0.01 * height),
      //                 ),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     Text("Name : ${data2["name"]}"),
      //                     Text("Price : ${data2["price"]}"),
      //                     Text("Discount : ${data2["discount"]}"),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         );
      //       } else {
      //         return const Center(
      //           child: Text("No Favourite Product"),
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
      //       .collection("favourite")
      //       .where("is_favourite", isEqualTo: false)
      //       .snapshots(),
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
      //       return const Center(
      //           child: Text("No Favourite Product Available"));
      //     }
      //   },
      // ),
      // ),
    );
  }
}
