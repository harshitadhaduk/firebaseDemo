import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskTextController extends GetxController {
  List data = [];
  TextEditingController textEditingController = TextEditingController();
  TextEditingController updateTextController = TextEditingController();

  void addData() {
    data.add(textEditingController.text);
    textEditingController.clear();
    update();
  }

  void deleteData(String deleteText) {
    data.remove(deleteText);
    update();
  }

  void updateData(int updateIndex) {
    data[updateIndex] = updateTextController.text;
    updateTextController.clear();
    update();
  }
}
