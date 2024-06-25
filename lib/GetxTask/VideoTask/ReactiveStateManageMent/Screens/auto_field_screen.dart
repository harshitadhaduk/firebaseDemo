import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:timer_count_down/timer_count_down.dart';

class AutoFieldScreen extends GetView<AutoFieldController> {
  const AutoFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AutoFieldController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => PinFieldAutoFill(
                textInputAction: TextInputAction.done,
                decoration: UnderlineDecoration(
                  textStyle: const TextStyle(color: Colors.blue),
                  colorBuilder: const FixedColorBuilder(Colors.cyan),
                  bgColorBuilder: FixedColorBuilder(Colors.grey.shade200),
                ),
                onCodeSubmitted: (code) {},
                controller: controller.textEditingController,
                currentCode: controller.msgOtpCode.value,
                onCodeChanged: (code) {
                  controller.msgOtpCode.value = code!;
                  controller.countdownController.pause();
                },
              ),
            ),
            const SizedBox(height: 10),
            Countdown(
              seconds: 15,
              interval: const Duration(milliseconds: 1000),
              build: (p0, p1) {
                if (p1 == 0.0) {
                  return GestureDetector(
                    onTap: () {
                      //write logic hereto resend otp
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                      ),
                      width: context.width,
                      child: const Text("Resend OTP"),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue),
                    ),
                    width: context.width,
                    child: Text("Wait $p1"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
