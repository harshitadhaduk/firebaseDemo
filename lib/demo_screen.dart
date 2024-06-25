import 'package:firebase_demo/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  Future getData() async {
    await Future.delayed(Duration(seconds: 2));
    return 100;
  }

  CounterController counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    //print("hello");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text('${snapshot.data}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return const Text("ERROR");
                }
              },
            ),
            GetBuilder<CounterController>(
              builder: (controller) => ElevatedButton(
                onPressed: () {
                  //  controller.increment();
                },
                child: Text('${controller.count}'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
