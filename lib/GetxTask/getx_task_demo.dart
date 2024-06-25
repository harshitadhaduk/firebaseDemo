import 'package:firebase_demo/controller/task_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXTaskDemo extends StatefulWidget {
  const GetXTaskDemo({super.key});

  @override
  State<GetXTaskDemo> createState() => _GetXTaskDemoState();
}

class _GetXTaskDemoState extends State<GetXTaskDemo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.04 * width,
            vertical: 0.01 * height,
          ),
          child: GetBuilder<TaskTextController>(
            builder: (controller) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: controller.textEditingController,
                      decoration: InputDecoration(
                        constraints: BoxConstraints.expand(
                          height: 0.1 * height,
                          width: 0.7 * width,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        hintText: "add Data",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.textEditingController.text.isEmpty
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Enter Data"),
                                ),
                              )
                            : controller.addData();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(0.2 * width, 0.06 * height),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                Expanded(
                  child: controller.data.isEmpty
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : ListView.builder(
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkResponse(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        controller.updateTextController.text =
                                            controller.data[index];
                                        return Dialog(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 0.02 * height,
                                              horizontal: 0.02 * width,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller: controller
                                                      .updateTextController,
                                                  decoration: InputDecoration(
                                                    constraints:
                                                        BoxConstraints.expand(
                                                      height: 0.1 * height,
                                                      width: 0.75 * width,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.01 * height),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    controller
                                                        .updateData(index);
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize: Size(
                                                        0.35 * width,
                                                        0.07 * height),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.01 * height),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    "Save Data",
                                                    style: TextStyle(
                                                      fontSize: 0.04 * width,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 0.07 * height,
                                    width: 0.7 * width,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0.01 * height),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.circular(0.01 * height),
                                    ),
                                    child: Center(
                                      child: Text("${controller.data[index]}"),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller
                                        .deleteData(controller.data[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(0.2 * width, 0.07 * height),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(0.01 * height),
                                      side:
                                          const BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
