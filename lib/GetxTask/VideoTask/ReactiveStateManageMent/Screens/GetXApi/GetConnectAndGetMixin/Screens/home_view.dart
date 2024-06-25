import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage("${state[index]["picture"]["large"]}"),
                    ),
                    title: Text(
                      "${state[index]["name"]["title"]} ${state[index]["name"]["first"]} ${state[index]["name"]["last"]}",
                    ),
                    trailing: Text("${state[index]["email"]}"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
