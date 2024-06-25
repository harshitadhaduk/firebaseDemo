import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperScreen extends GetView<StepperDemoController> {
  const StepperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StepperDemoController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stepper(
            currentStep: controller.currentStep.value,
            type: StepperType.horizontal,
            steps: buildStep(),
            onStepContinue: () {
              if (controller.currentStep.value == buildStep().length - 1) {
                print("send data to server");
              } else {
                controller.currentStep.value++;
              }
            },
            onStepCancel: () {
              controller.currentStep.value == 0
                  ? null
                  : controller.currentStep.value--;
            },
            onStepTapped: (value) {
              controller.currentStep.value = value;
            },
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(
                          controller.currentStep.value == buildStep().length - 1
                              ? "Submit"
                              : "Next"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  if (controller.currentStep.value != 0)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        child: const Text("Previous"),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
        title: const Text("Person"),
        content: Container(
          height: 100,
          width: 200,
          color: Colors.red.shade100,
        ),
        state: controller.currentStep.value > 0
            ? StepState.complete
            : StepState.indexed,
        isActive: controller.currentStep.value >= 0,
      ),
      Step(
        title: const Text("Business"),
        content: Container(
          height: 100,
          width: 200,
          color: Colors.red.shade200,
        ),
        state: controller.currentStep.value > 1
            ? StepState.complete
            : StepState.indexed,
        isActive: controller.currentStep.value >= 1,
      ),
      Step(
        title: const Text("Confirm"),
        content: Container(
          height: 100,
          width: 200,
          color: Colors.red.shade300,
        ),
        isActive: controller.currentStep.value >= 2,
      ),
    ];
  }
}
