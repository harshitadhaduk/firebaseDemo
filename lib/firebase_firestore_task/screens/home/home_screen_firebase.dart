import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/details_screen_firebase.dart';
import 'package:flutter/material.dart';

class HomeScreenFireBase extends StatefulWidget {
  final user;
  const HomeScreenFireBase({super.key, this.user});

  @override
  State<HomeScreenFireBase> createState() => _HomeScreenFireBaseState();
}

class _HomeScreenFireBaseState extends State<HomeScreenFireBase> {
  final firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> allData = [];
  List idData = [];
  bool loading = false;

  void getAllData() async {
    setState(() {
      loading = true;
    });
    var data = await firebaseFirestore.collection("product").get();

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
    var userId = auth.currentUser!.uid;

    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * width, vertical: 0.01 * height),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.01 * height,
                    crossAxisSpacing: 0.02 * width,
                  ),
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    var data2 = allData[index];
                    var id = idData[index];
                    return InkResponse(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreenFireBase(
                              id: id,
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 0.25 * height,
                            width: 0.5 * width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(0.01 * height),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Name : ${data2["name"]}"),
                                Text("Price : ${data2['price']}"),
                                ElevatedButton(
                                  onPressed: () {
                                    firebaseFirestore.collection("order").add(
                                      {
                                        "sellerId": data2["userid"],
                                        "name": data2["name"],
                                        "price": data2["price"],
                                        "discount": data2["discount"],
                                        "description": data2["description"],
                                        "userId": userId,
                                      },
                                    );
                                  },
                                  child: const Text("Buy"),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0.01 * height,
                            right: 0.01 * width,
                            child: IsLikeButton(
                              docId: id,
                              isFavourite: data2["is_favourite"] == true,
                              name: data2["name"],
                              price: data2["price"],
                              description: data2["description"],
                              discount: data2["discount"],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
        // child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        //   stream: firebaseFirestore.collection("product").snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.data?.docs.isNotEmpty ?? false) {
        //       var userId = auth.currentUser!.uid;
        //       return Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: 0.04 * width, vertical: 0.01 * height),
        //         child: GridView.builder(
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 0.01 * height,
        //             crossAxisSpacing: 0.02 * width,
        //           ),
        //           itemCount: snapshot.data!.docs.length,
        //           itemBuilder: (context, index) {
        //             var data = snapshot.data!.docs[index].data();
        //             var getId = snapshot.data!.docs[index].id;
        //             return InkResponse(
        //               onTap: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => DetailsScreenFireBase(
        //                       id: getId,
        //                     ),
        //                   ),
        //                 );
        //               },
        //               child: Stack(
        //                 children: [
        //                   Container(
        //                     height: 0.25 * height,
        //                     width: 0.5 * width,
        //                     decoration: BoxDecoration(
        //                       border: Border.all(color: Colors.black),
        //                       borderRadius:
        //                           BorderRadius.circular(0.01 * height),
        //                     ),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       crossAxisAlignment: CrossAxisAlignment.center,
        //                       children: [
        //                         Text("Name : ${data["name"]}"),
        //                         Text("Price : ${data["price"]}"),
        //                         ElevatedButton(
        //                           onPressed: () {
        //                             firebaseFirestore.collection("order").add({
        //                               "sellerId": data["userid"],
        //                               "name": data["name"],
        //                               "price": data["price"],
        //                               "discount": data["discount"],
        //                               "description": data["description"],
        //                               "userId": userId,
        //                             });
        //                           },
        //                           child: const Text("Buy"),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   Positioned(
        //                     top: 0.01 * height,
        //                     right: 0.01 * width,
        //                     child: IsLikeButton(
        //                       docId: getId,
        //                       isFavourite: data["is_favourite"] == true,
        //                       name: data["name"],
        //                       price: data["price"],
        //                       description: data["description"],
        //                       discount: data["discount"],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         ),
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        // child: FutureBuilder(
        //   future: firebaseFirestore.collection("product").get(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       var data = snapshot.data!.docs;
        //       return GridView.builder(
        //         padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           crossAxisSpacing: 0.01 * width,
        //         ),
        //         itemCount: data.length,
        //         itemBuilder: (context, index) {
        //           var data2 = data[index].data();
        //           var userId = auth.currentUser!.uid;
        //           print(userId);
        //           print("${data2["name"]}");
        //
        //           return Stack(
        //             children: [
        //               Container(
        //                 height: 0.2 * height,
        //                 width: 0.4 * width,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(0.01 * height),
        //                   border: Border.all(color: Colors.black),
        //                 ),
        //                 child: Column(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: [
        //                     Text("Name : ${data2["name"]}"),
        //                     Text("Price : ${data2["price"]}"),
        //                     Text("Discount : ${data2["discount"]}"),
        //                     ElevatedButton(
        //                       onPressed: () {
        //                         firebaseFirestore
        //                             .collection("userData")
        //                             .doc(userId)
        //                             .collection("buy product")
        //                             .add({
        //                           "name": "${data2["name"]}",
        //                           "price": "${data2["price"]}",
        //                           "discount": "${data2["discount"]}",
        //                           "description": "${data2["description"]}",
        //                         });
        //                         firebaseFirestore
        //                             .collection("userData")
        //                             .doc("g0JR8fH3DYd759Yg6IxGqeTqwAi2")
        //                             .collection("order Data")
        //                             .add({
        //                           "userId": userId,
        //                           "name": "${data2["name"]}",
        //                           "price": "${data2["price"]}",
        //                           "discount": "${data2["discount"]}",
        //                           "description": "${data2["description"]}",
        //                         });
        //                       },
        //                       child: const Text("Buy"),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Positioned(
        //                 top: 0.01 * height,
        //                 right: 0.07 * width,
        //                 child: IsLikeButton(
        //                   docId: userId,
        //                   name: "${data2["name"]}",
        //                   price: "${data2["price"]}",
        //                   discount: "${data2["discount"]}",
        //                   description: "${data2["description"]}",
        //                 ),
        //               ),
        //             ],
        //           );
        //         },
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

class IsLikeButton extends StatefulWidget {
  final bool isFavourite;
  final String docId;
  final userId;
  final name;
  final price;
  final discount;
  final description;

  const IsLikeButton({
    super.key,
    this.isFavourite = false,
    required this.docId,
    this.userId,
    this.name,
    this.price,
    this.discount,
    this.description,
  });

  @override
  State<IsLikeButton> createState() => _IsLikeButtonState();
}

class _IsLikeButtonState extends State<IsLikeButton> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var userId = auth.currentUser!.uid;

    return InkResponse(
      onTap: () {
        firebaseFirestore.collection("product").doc(widget.docId).update({
          'is_favourite': !widget.isFavourite,
          "favuserid": userId,
        });

        widget.isFavourite != true
            ? firebaseFirestore
                .collection("userData")
                .doc(userId)
                .collection("favourite")
                .add({
                "name": widget.name,
                "price": widget.price,
                "discount": widget.discount,
                "description": widget.description,
                "userId": userId,
                "is_favourite": widget.isFavourite,
              })
            : const SizedBox();
      },
      child: widget.isFavourite
          ? Icon(
              Icons.favorite,
              color: Colors.red,
              size: 0.03 * height,
            )
          : Icon(
              Icons.favorite_outline,
              color: Colors.red,
              size: 0.03 * height,
            ),
    );
  }
}
