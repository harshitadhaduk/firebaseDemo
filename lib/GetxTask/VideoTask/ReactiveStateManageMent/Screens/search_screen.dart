import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/all_controller.dart';

class SearchScreen extends GetView<SearchDemoController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDemoController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => controller.filterPlayer(value),
              decoration: const InputDecoration(
                labelText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.foundPlayer.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "${controller.foundPlayer.value[index]["name"]}"),
                      subtitle: Text(
                          "${controller.foundPlayer.value[index]["country"]}"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
