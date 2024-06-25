import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

class LikeButtonScreen extends GetView<LikeButtonController> {
  const LikeButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LikeButtonController());
    return Scaffold(
      body: Center(
        child: LikeButton(
          size: 50,
          likeCount: controller.getStorage.read("likeCount") ?? 0,
          countPostion: CountPostion.bottom,
          // circleColor: ,
          // bubblesColor: ,
          // likeBuilder: (isLiked) {
          //   return Icon(
          //     Icons.shield_moon,
          //     size: 50,
          //     color: isLiked ? Colors.red : Colors.grey,
          //   );
          // },
          countBuilder: (likeCount, isLiked, text) {
            return Text(
              likeCount == 0 ? "" : text,
              style: TextStyle(
                color: isLiked ? Colors.red : Colors.grey,
              ),
            );
          },
          onTap: (isLiked) {
            return controller.saveLikeCount(isLiked);
          },
          isLiked: controller.getStorage.read("isLiked") ?? false,
        ),
      ),
    );
  }
}
