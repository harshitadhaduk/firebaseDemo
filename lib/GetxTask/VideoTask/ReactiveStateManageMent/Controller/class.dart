import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Student {
  // var name = "Tom".obs;
  // var age = 25.obs;

  var name;
  var age;
  Student({this.name, this.age});
}

class GetStorageKey {
  static const is_dark_mode = "sms_is_dark_mode";
}

class Players {
  final String? name;
  Players({this.name});
}

class Employees {
  final String name;
  var isSelected = false.obs;
  Employees({required this.name, required this.isSelected});
}

class ExpansionEmployee {
  ExpansionEmployee({
    this.body,
    this.header,
    this.isExpanded,
  });
  String? body;
  String? header;
  RxBool? isExpanded;
}

class CountryAutoComplete {
  CountryAutoComplete({
    required this.name,
  });
  final String name;
}

class EmployeesModel {
  final String name;
  final String address;
  EmployeesModel({required this.name, required this.address});
}
