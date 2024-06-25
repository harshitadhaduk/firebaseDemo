import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/pick_task/firebase_store/update_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStoreImage extends StatefulWidget {
  const FirebaseStoreImage({super.key});

  @override
  State<FirebaseStoreImage> createState() => _FirebaseStoreImageState();
}

class _FirebaseStoreImageState extends State<FirebaseStoreImage> {
  List imageData = [];
  List imageCG = [];
  List id = [];
  ImagePicker picker = ImagePicker();
  File? image;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  bool loading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    setState(() {
      loading = true;
    });
    Stream<QuerySnapshot<Map<String, dynamic>>> getdata = firebaseFirestore
        .collection("image")
        .orderBy("time", descending: false)
        .snapshots();

    getdata.listen((event) {
      imageData.clear();
      for (var element in event.docs) {
        imageData.add(element.data());
        id.add(element.id);
        setState(() {});
      }
    });

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: imageData.length,
                      itemBuilder: (context, index) {
                        String allData = imageData[index]["image"];
                        bool isCheck = allData.startsWith("http");
                        return InkResponse(
                          onTap: () {
                            var name = imageData[index]["name"];
                            var getId = id[index];
                            print("********$getId");
                            print("*******$name");
                            setState(() {
                              if (isCheck) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateScreen(
                                      image: allData,
                                      id: getId,
                                      name: "$name",
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("please upload image"),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            height: 0.25 * height,
                            width: 0.4 * width,
                            margin: EdgeInsets.symmetric(
                                vertical: 0.02 * height,
                                horizontal: 0.2 * width),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(0.01 * height),
                              image: isCheck
                                  ? DecorationImage(
                                      image: NetworkImage(allData),
                                      fit: BoxFit.fill,
                                    )
                                  : DecorationImage(
                                      image: FileImage(
                                        File(allData),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (imageCG.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Pic Image"),
                          ),
                        );
                      } else {
                        for (var element in imageCG) {
                          storage
                              .ref("imageData/${element.name}")
                              .putFile(File(element.path))
                              .then((p0) async {
                            var uri = await p0.ref.getDownloadURL();
                            await firebaseFirestore.collection("image").add({
                              "name": element.name,
                              "image": uri,
                              "time": DateTime.now(),
                            });
                            imageCG.clear();
                          });
                        }
                      }
                    },
                    child: const Text("Upload"),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.05 * height),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "PICK IMAGE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 0.06 * width,
                        ),
                      ),
                      SizedBox(height: 0.01 * height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? file = await picker.pickImage(
                                  source: ImageSource.camera);
                              image = File(file!.path);
                              imageCG.add(file);
                              print("--------${file.path}");
                              imageData.add({"image": file.path});
                              setState(() {});
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.01 * height),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 0.06 * width,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.045 * width,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              List<XFile> file1 = await picker.pickMultiImage();
                              for (var element in file1) {
                                image = File(element.path);
                                imageCG.add(element);
                                print("------------${element.path}");
                                imageData.add({"image": element.path});
                              }
                              setState(() {});
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.01 * height),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.black,
                                  size: 0.06 * width,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.045 * width,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 0.035 * height,
        ),
      ),
    );
  }
}
