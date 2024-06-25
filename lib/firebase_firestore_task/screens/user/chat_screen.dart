import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final userid;
  final sellerid;
  final productId;
  const ChatScreen({
    super.key,
    this.userid,
    this.sellerid,
    this.productId,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController userController = TextEditingController();

  List<Map<String, dynamic>> allData = [];

  bool loading = false;

  // void getData() async {
  //   setState(() {
  //     loading = true;
  //   });
  //
  //   QuerySnapshot data = await firebaseFirestore
  //       .collection("chat")
  //       .where("productId", isEqualTo: widget.productId)
  //       .orderBy("time", descending: false)
  //       .get();
  //
  //   for (var element in data.docs) {
  //     allData.add(element.data() as Map<String, dynamic>);
  //   }
  //
  //   setState(() {
  //     loading = false;
  //   });
  // }

  void getDataLive() async {
    var data = await firebaseFirestore
        .collection("chat")
        .where("productId", isEqualTo: widget.productId)
        .orderBy("time", descending: false)
        .get();

    setState(() {
      for (var element in data.docs) {
        allData.add(element.data());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLive();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var userId = auth.currentUser!.uid;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0.02 * height),
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  var data = allData[index];
                  return Align(
                    alignment: userId == data["msgId"]
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: userId == data["msgId"]
                            ? Colors.teal.shade800
                            : Colors.black,
                        borderRadius: BorderRadius.circular(0.02 * width),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.04 * width,
                        vertical: 0.005 * height,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 0.005 * height,
                        horizontal: 0.04 * width,
                      ),
                      child: Text(
                        "${data['msg']}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.045 * width,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.01 * height),
                    ),
                    hintText: "Message",
                    constraints: BoxConstraints.expand(
                      height: 0.07 * height,
                      width: 0.75 * width,
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    firebaseFirestore.collection("chat").add(
                      {
                        "msgId": auth.currentUser!.uid,
                        "msg": userController.text,
                        "productId": widget.productId,
                        "time": DateTime.now(),
                      },
                    );
                    getDataLive();
                    allData.clear();
                    userController.clear();
                  },
                  child: CircleAvatar(
                    radius: 0.03 * height,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.send,
                      size: 0.04 * height,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // child: StreamBuilder(
        //   stream: firebaseFirestore
        //       .collection("chat")
        //       .where("productId", isEqualTo: widget.productId)
        //       .orderBy("time", descending: false)
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.data?.docs.isNotEmpty ?? false) {
        //       var data = snapshot.data!.docs;
        //       return Column(
        //         children: [
        //           Expanded(
        //             child: ListView.builder(
        //               padding: EdgeInsets.only(top: 0.015 * height),
        //               itemCount: data.length,
        //               itemBuilder: (context, index) {
        //                 var data2 = data[index].data();
        //                 return Align(
        //                   alignment: userId == data2["msgId"]
        //                       ? Alignment.centerRight
        //                       : Alignment.centerLeft,
        //                   child: Container(
        //                     decoration: BoxDecoration(
        //                       color: userId == data2["msgId"]
        //                           ? Colors.teal.shade800
        //                           : Colors.black,
        //                       borderRadius:
        //                           BorderRadius.circular(0.008 * height),
        //                     ),
        //                     padding: EdgeInsets.symmetric(
        //                       horizontal: 0.04 * width,
        //                       vertical: 0.005 * height,
        //                     ),
        //                     margin: EdgeInsets.symmetric(
        //                       vertical: 0.005 * height,
        //                       horizontal: 0.04 * width,
        //                     ),
        //                     child: Text(
        //                       "${data2["msg"]}",
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 0.045 * width,
        //                       ),
        //                     ),
        //                   ),
        //                 );
        //               },
        //             ),
        //           ),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               TextFormField(
        //                 controller: userController,
        //                 decoration: InputDecoration(
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(0.01 * height),
        //                   ),
        //                   hintText: "Message",
        //                   constraints: BoxConstraints.expand(
        //                     height: 0.07 * height,
        //                     width: 0.75 * width,
        //                   ),
        //                 ),
        //               ),
        //               InkResponse(
        //                 onTap: () {
        //                   firebaseFirestore.collection("chat").add(
        //                     {
        //                       "msgId": auth.currentUser!.uid,
        //                       "msg": userController.text,
        //                       "productId": widget.productId,
        //                       "time": DateTime.now(),
        //                     },
        //                   );
        //                   userController.clear();
        //                 },
        //                 child: CircleAvatar(
        //                   radius: 0.03 * height,
        //                   backgroundColor: Colors.teal,
        //                   child: Icon(
        //                     Icons.send,
        //                     size: 0.04 * height,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       );
        //     } else {
        //       return Column(
        //         children: [
        //           const Spacer(),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               TextFormField(
        //                 controller: userController,
        //                 decoration: InputDecoration(
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.circular(0.01 * height),
        //                   ),
        //                   hintText: "Message",
        //                   constraints: BoxConstraints.expand(
        //                     height: 0.07 * height,
        //                     width: 0.75 * width,
        //                   ),
        //                 ),
        //               ),
        //               InkResponse(
        //                 onTap: () {
        //                   firebaseFirestore.collection("chat").add({
        //                     "msgId": auth.currentUser!.uid,
        //                     "msg": userController.text,
        //                     "productId": widget.productId,
        //                     "time": DateTime.now(),
        //                   });
        //                   userController.clear();
        //                 },
        //                 child: CircleAvatar(
        //                   radius: 0.03 * height,
        //                   backgroundColor: Colors.teal,
        //                   child: Icon(
        //                     Icons.send,
        //                     size: 0.04 * height,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
