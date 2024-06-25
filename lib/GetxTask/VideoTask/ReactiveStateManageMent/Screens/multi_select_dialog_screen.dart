import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../Controller/all_controller.dart';

class MultiSelectDialogScreen extends StatefulWidget {
  const MultiSelectDialogScreen({super.key});

  @override
  State<MultiSelectDialogScreen> createState() =>
      _MultiSelectDialogScreenState();
}

class _MultiSelectDialogScreenState extends State<MultiSelectDialogScreen> {
  MultiPlayerController controller = Get.put(MultiPlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            MultiSelectDialogField(
              chipDisplay: MultiSelectChipDisplay.none(),
              selectedColor: Colors.blue,
              items: controller.player
                  .map((player) => MultiSelectItem(player, player.name!))
                  .toList(),
              onConfirm: (result) {
                controller.selectedPlayer = result;
                controller.selectPlayerValue.value = "";
                for (var element in controller.selectedPlayer) {
                  controller.selectPlayerValue.value =
                      "${controller.selectPlayerValue.value}  ${element.name}";
                }
              },
              searchable: true,
              title: const Text("Player"),
              buttonText: Text(
                "Favorite Player",
                style: TextStyle(
                  color: Colors.blue.shade800,
                ),
              ),
              buttonIcon: const Icon(
                Icons.account_box,
                color: Colors.blue,
              ),
              listType: MultiSelectListType.LIST,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Text(controller.selectPlayerValue.value),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.showMultiSelect();
              },
              child: const Text("Show"),
            ),
          ],
        ),
      ),
    );
  }
}
