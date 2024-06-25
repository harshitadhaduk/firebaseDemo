import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DemoImage extends StatefulWidget {
  const DemoImage({super.key});

  @override
  State<DemoImage> createState() => _DemoImageState();
}

class _DemoImageState extends State<DemoImage> {
  ImagePicker picker = ImagePicker();
  File? image;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                XFile? file =
                    await picker.pickImage(source: ImageSource.camera);
                image = File(file!.path);
                setState(() {});
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3)),
                child: image != null
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.black,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                storage
                    .ref("profile/image.png")
                    .putFile(image!)
                    .then((p0) async {
                  String uri = await p0.ref.getDownloadURL();

                  print("IMAGE $uri");
                });
              },
              child: const Text('upload'),
            ),
          ],
        ),
      ),
    );
  }
}
