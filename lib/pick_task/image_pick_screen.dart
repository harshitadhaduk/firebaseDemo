import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickScreen extends StatefulWidget {
  const ImagePickScreen({super.key});

  @override
  State<ImagePickScreen> createState() => _ImagePickScreenState();
}

class _ImagePickScreenState extends State<ImagePickScreen> {
  List imageData = [];
  ImagePicker picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                              imageData.add(image);
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
                                imageData.add(image);
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
      body: SafeArea(
        child: imageData.isEmpty
            ? const Center(
                child: Text("No Data"),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 0.2 * width),
                itemCount: imageData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 0.3 * height,
                    width: 0.2 * width,
                    margin: EdgeInsets.symmetric(vertical: 0.015 * height),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(0.01 * height),
                      image: DecorationImage(
                        image: FileImage(
                          imageData[index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
