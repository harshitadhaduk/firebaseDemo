import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailsScreenFireBase extends StatefulWidget {
  final id;
  const DetailsScreenFireBase({
    super.key,
    this.id,
  });

  @override
  State<DetailsScreenFireBase> createState() => _DetailsScreenFireBaseState();
}

class _DetailsScreenFireBaseState extends State<DetailsScreenFireBase> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> allData = [];
  bool loading = false;

  void getData() async {
    setState(() {
      loading = true;
    });

    var data =
        await firebaseFirestore.collection("product").doc("${widget.id}").get();

    allData.add(data.data() as Map<String, dynamic>);
    print("$data");

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getData();
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
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04 * width,
                  vertical: 0.02 * height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : ${allData[0]["name"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Price : ${allData[0]["price"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Discount : ${allData[0]["discount"]}"),
                    SizedBox(height: 0.01 * height),
                    Text("Description : ${allData[0]["description"]}"),
                  ],
                ),
                // child: FutureBuilder(
                //   future: firebaseFirestore
                //       .collection("product")
                //       .doc("${widget.id}")
                //       .get(),
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       Map<String, dynamic>? data = snapshot.data!.data();
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text("Name : ${data!["name"]}"),
                //           SizedBox(height: 0.01 * height),
                //           Text("Price : ${data["price"]}"),
                //           SizedBox(height: 0.01 * height),
                //           Text("Discount : ${data["discount"]}"),
                //           SizedBox(height: 0.01 * height),
                //           Text("Description : ${data["description"]}"),
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
            ),
    );
  }
}
