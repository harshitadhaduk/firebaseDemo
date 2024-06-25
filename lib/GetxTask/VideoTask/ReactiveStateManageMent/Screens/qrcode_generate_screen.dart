import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerateScreen extends GetView<QrCodeController> {
  const QrCodeGenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QrCodeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(
                () => QrImageView(
                  data: controller.qrImage.value,
                  size: 200,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Qr Code",
                ),
                controller: controller.qrCode,
                onChanged: (value) {
                  controller.qrImage.value = value;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  controller.scanQr();
                },
                child: const Text("Scan QR"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
