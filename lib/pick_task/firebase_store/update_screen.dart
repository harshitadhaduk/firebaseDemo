import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateScreen extends StatefulWidget {
  final image;
  final id;
  final name;

  const UpdateScreen({
    super.key,
    this.image,
    this.id,
    this.name,
  });

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ImagePicker picker = ImagePicker();
  File? image;
  XFile? file;

  void updateCameraImage() async {
    file = await picker.pickImage(source: ImageSource.camera);
    image = File(file!.path);
    storage.ref("imageData/${widget.name}").putFile(image!).then((p0) async {
      String uri = await p0.ref.getDownloadURL();
      print("---------------------$uri");
      firebaseFirestore.collection("image").doc(widget.id).update({
        "image": uri,
      });
    });
    setState(() {});
    Navigator.pop(context);
  }

  void updateGalleryImage() async {
    file = await picker.pickImage(source: ImageSource.gallery);
    image = File(file!.path);
    storage.ref("imageData/${widget.name}").putFile(image!).then((p0) async {
      String uri = await p0.ref.getDownloadURL();
      print(" ------------->$uri");
      firebaseFirestore.collection("image").doc(widget.id).update({
        "image": uri,
      });
    });

    setState(() {});
    Navigator.pop(context);
  }

  void deleteImage() async {
    print("Delete Data");
    await image?.delete();
    firebaseFirestore.collection("image").doc(widget.id).delete();
    storage.ref("imageData/${widget.name}").delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Delete Successfully"),
      ),
    );
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            SizedBox(
              height: 0.85 * height,
              width: double.infinity,
              child: image == null
                  ? Image.network("${widget.image}")
                  : Image.file(image!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteImage();
                  },
                  child: const Text("Delete"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 0.05 * height),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        updateCameraImage();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              0.01 * height),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                      onPressed: () {
                                        updateGalleryImage();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              0.01 * height),
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
                  child: const Text("Update"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
