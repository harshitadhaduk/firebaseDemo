import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DemoCloudFirestoreDetailsScreen extends StatefulWidget {
  final String? id;

  const DemoCloudFirestoreDetailsScreen({super.key, this.id});

  @override
  State<DemoCloudFirestoreDetailsScreen> createState() =>
      _DemoCloudFirestoreDetailsScreenState();
}

class _DemoCloudFirestoreDetailsScreenState
    extends State<DemoCloudFirestoreDetailsScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          firebaseFirestore.collection("user").add({
            "id": "20",
            "name": "assds",
            "email": "121212",
          });
        },
      ),
      body: Center(
        child: FutureBuilder(
          future: firebaseFirestore.collection("user").doc(widget.id).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic>? data = snapshot.data!.data();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Id : ${data!["id"]}",
                  ),
                  Text(
                    "Name : ${data["name"]}",
                  ),
                  Text(
                    "Email : ${data['email']}",
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
