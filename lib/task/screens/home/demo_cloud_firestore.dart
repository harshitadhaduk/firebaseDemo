import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/task/screens/home/demo_cloud_firestore_details_screen.dart';
import 'package:flutter/material.dart';

class DemoCloud extends StatefulWidget {
  const DemoCloud({super.key});

  @override
  State<DemoCloud> createState() => _DemoCloudState();
}

class _DemoCloudState extends State<DemoCloud> {
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
      body: SafeArea(
        child: FutureBuilder(
          future: firebaseFirestore.collection("user").get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.docs;
              return Column(
                children: [
                  Container(
                    color: Colors.teal.shade700,
                    child: const ListTile(
                      leading: Text(
                        "Id",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      trailing: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkResponse(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DemoCloudFirestoreDetailsScreen(
                                  id: data[index].id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: index % 2 == 1
                                ? Colors.teal.shade100
                                : Colors.teal.shade50,
                            child: ListTile(
                              leading: Text(
                                "${data[index]["id"]}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              title: Text(
                                "${data[index]["name"]}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              trailing: Text(
                                "${data[index]["email"]}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
