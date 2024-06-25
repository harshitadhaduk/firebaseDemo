import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutoCompleteScreen extends GetView<AutoCompleteController> {
  const AutoCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AutoCompleteController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Autocomplete<CountryAutoComplete>(
            optionsBuilder: (textEditingValue) {
              return controller.countryName
                  .where((CountryAutoComplete complete) => complete.name
                      .toLowerCase()
                      .startsWith(textEditingValue.text.toLowerCase()))
                  .toList();
            },
            displayStringForOption: (option) => option.name,
            fieldViewBuilder:
                (context, textEditingController, focusNode, onFieldSubmitted) {
              return TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Select Country",
                ),
                controller: textEditingController,
                focusNode: focusNode,
              );
            },
            onSelected: (option) {
              print("Selected ${option.name}");
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  child: Container(
                    width: 330,
                    color: Colors.pink.shade100,
                    child: ListView.builder(
                      itemCount: options.length,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        final CountryAutoComplete option =
                            options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            title: Text(option.name),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
