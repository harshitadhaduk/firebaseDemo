import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmojiPickerScreen extends GetView<EmojiController> {
  const EmojiPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmojiController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          if (controller.isEmojiVisible.value) {
            controller.isEmojiVisible.value = false;
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            SizedBox(
              height: 90,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.isEmojiVisible.value =
                          !controller.isEmojiVisible.value;
                      controller.focusNode.unfocus();
                      controller.focusNode.canRequestFocus = true;
                    },
                    icon: const Icon(Icons.emoji_emotions_outlined),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 10),
                      child: TextField(
                        controller: controller.textEditingController,
                        focusNode: controller.focusNode,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Offstage(
                offstage: !controller.isEmojiVisible.value,
                child: SizedBox(
                  height: 300,
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      controller.textEditingController.text =
                          controller.textEditingController.text + emoji.emoji;
                    },
                    onBackspacePressed: () {},
                    config: const Config(
                      emojiViewConfig: EmojiViewConfig(
                        columns: 7,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        backgroundColor: Colors.white,
                        buttonMode: ButtonMode.MATERIAL,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
