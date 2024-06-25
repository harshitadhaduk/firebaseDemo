import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/all_controller.dart';

class DemoImplementInScreen extends StatefulWidget {
  const DemoImplementInScreen({super.key});

  @override
  State<DemoImplementInScreen> createState() => _DemoImplementInScreenState();
}

class _DemoImplementInScreenState extends State<DemoImplementInScreen> {
  StudentController studentController = Get.put(StudentController());
  // var student = Student();
  //final student1 = Student(name: "Tom", age: 25).obs;

  // var count = 0.obs;
  // void increment() {
  //   count++;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(
            //   () => Text("count value is ${count}"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     increment();
            //   },
            //   child: Text("Tap"),
            // ),

            //already assign
            // Obx(
            //   () => Text(student.name.value),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     student.name.value = student.name.value.toUpperCase();
            //   },
            //   child: const Text("Upper"),
            // ),

            //not initialise
            // Obx(
            //   () => Text("${student1.value.name}"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     student1.update((val) {
            //       val?.name = val.name.toString().toUpperCase();
            //     });
            //   },
            //   child: const Text("upper"),
            // ),

            // logic and ui difference initialise
            // Obx(
            //   () => Text("${studentController.student.name}"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     studentController.convertUpperCase();
            //   },
            //   child: const Text("Upper"),
            // ),
            Obx(
              () => Text("${studentController.student.value.name}"),
            ),
            ElevatedButton(
              onPressed: () {
                studentController.convertToUpperClass();
              },
              child: const Text("Upper"),
            ),
          ],
        ),
      ),
    );
  }
}
