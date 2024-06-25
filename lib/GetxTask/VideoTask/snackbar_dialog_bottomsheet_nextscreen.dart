import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx_task_demo.dart';

class MixScreen extends StatefulWidget {
  const MixScreen({super.key});

  @override
  State<MixScreen> createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "SnackBar", "SnackBar msg",
                  //only use msg not work title and msg text
                  colorText: Colors.pink,
                  snackPosition: SnackPosition.BOTTOM,
                  titleText: const Text("another Text"),
                  messageText: const Text("another message text"),
                  backgroundColor: Colors.black12,
                  borderRadius: 10,
                  margin: EdgeInsets.symmetric(
                      vertical: 0.01 * height, horizontal: 0.04 * width),
                  //maxWidth: 200,
                  //  animationDuration: Duration(seconds: 3),
                  backgroundGradient: LinearGradient(
                    colors: [
                      Colors.pink.shade800,
                      Colors.pink.shade100,
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 0.01 * height, horizontal: 0.02 * width),
                  icon: const Icon(Icons.send),
                  // forwardAnimationCurve: Curves.bounceInOut,
                  // reverseAnimationCurve: Curves.bounceInOut,
                  //duration: Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.green,
                  overlayBlur: 10,
                  // userInputForm: Form(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: TextField(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  borderColor: Colors.grey,
                  borderWidth: 5,
                  // boxShadows: [
                  //   BoxShadow(
                  //     color: Colors.yellow,
                  //     blurRadius: 20,
                  //     spreadRadius: 2,
                  //     offset: Offset(30, 50),
                  //   ),
                  //    ],
                  showProgressIndicator: true,
                  progressIndicatorBackgroundColor: Colors.blue,
                  progressIndicatorValueColor:
                      const AlwaysStoppedAnimation(Colors.teal),
                );
              },
              child: const Text("Show SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "hello",
                  middleText: "by",
                  backgroundColor: Colors.grey,
                  cancelTextColor: Colors.black,
                  onConfirm: () {},
                  onCancel: () {},
                  radius: 20,
                  textCancel: "canceled",
                  textConfirm: "done",
                  barrierDismissible: false,
                  //content:    customise middle text
                  actions: [
                    TextButton(onPressed: () {}, child: const Text("action")),
                  ],
                );
              },
              child: const Text("Dialog"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  barrierColor: Colors.green,
                  backgroundColor: Colors.white,
                  Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.changeTheme(ThemeData.light());
                        },
                        title: const Text("Light Theme"),
                      ),
                      ListTile(
                        onTap: () {
                          Get.changeTheme(ThemeData.dark());
                        },
                        title: const Text("dark Theme"),
                      ),
                    ],
                  ),
                  isDismissible: false,
                  enableDrag: true,
                );
              },
              child: const Text("ShowModelBottomSheet"),
            ),
            ElevatedButton(
              onPressed: () {
                //Get.toNamed('/getXDemo');
                Get.to(() => GetXTaskDemo());

                // Get.to(
                //   () => GetXTaskDemo(), arguments: ["data2"],
                //   // fullscreenDialog: true,
                //   // transition: Transition.zoom,
                //   // duration: Duration(seconds: 2),
                //   // curve: Curves.bounceInOut,
                // );

                // var data = await Get.to(() => GetXTaskDemo());
                // print("received data--- ${data}");
                //Get.back();
                // Get.off(() => MixScreen());
                // Get.offAll(MixScreen());

                // use in back screen
                // ElevatedButton(
                //   onPressed: () {
                //     Get.back();
                //     Get.off(() => GetXTaskDemo());
                //     // Get.offAll(MixScreen());
                //   },
                //   child: Text("back"),
                // ),

                // data show second screen and received data
                // ElevatedButton(
                //     onPressed: () {
                //       Get.back(result: "data add");
                //     },
                //     child: Text("Back")),
                // Text("${Get.arguments[0]}"),

                // Get.toNamed("/getXDemo/1234");
                // name: "/getXDemo/:someValue",
                // Text("${Get.parameters["someValue"]}");

                // Get.toNamed("/getXDemo?chennal=hello&con=by");
                // Text("${Get.parameters["chennal"]}"),
              },
              child: const Text("Navigator"),
            ),
          ],
        ),
      ),
    );
  }
}
