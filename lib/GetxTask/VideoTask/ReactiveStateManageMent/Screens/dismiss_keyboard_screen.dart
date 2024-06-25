import 'package:flutter/material.dart';

class DismissKeyboardScreen extends StatelessWidget {
  const DismissKeyboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const Text(
                    "Hello ! How are you",
                    style: TextStyle(
                      fontSize: 110,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
