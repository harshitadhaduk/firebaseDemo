import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var userId = auth.currentUser!.uid;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
          child: Column(
            children: [
              SizedBox(height: 0.3 * height),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Product's Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.01 * height),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Product's Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.01 * height),
              TextField(
                controller: discountController,
                decoration: InputDecoration(
                  hintText: "Product's Price Discount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.01 * height),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Product's Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.01 * height),
                  ),
                ),
              ),
              SizedBox(height: 0.01 * height),
              ElevatedButton(
                onPressed: () {
                  firebaseFirestore.collection("product").add({
                    "userid": userId,
                    "name": nameController.text,
                    "price": priceController.text,
                    "discount": discountController.text,
                    "description": descriptionController.text,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Add Product Successfully"),
                    ),
                  );
                },
                child: const Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
