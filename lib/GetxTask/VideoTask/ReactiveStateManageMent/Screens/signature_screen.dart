import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends GetView<SignatureControllerDemo> {
  const SignatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignatureControllerDemo());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 750,
            child: Obx(
              () => Signature(
                controller: controller.signatureController,
                backgroundColor: controller.padColor.value,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkResponse(
                onTap: () {
                  controller.selectPadColor();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.black,
                  child: const Text(
                    "pad color",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkResponse(
                onTap: () {
                  controller.selectPenColor();
                  // controller.initializeSignatureController();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.white,
                  child: const Text(
                    "pen color",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              InkResponse(
                onTap: () {
                  controller.exportSignature();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.deepPurpleAccent.shade100,
                  child: const Text(
                    "Export",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              InkResponse(
                onTap: () {
                  controller.signatureController.clear();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: Colors.orange,
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
