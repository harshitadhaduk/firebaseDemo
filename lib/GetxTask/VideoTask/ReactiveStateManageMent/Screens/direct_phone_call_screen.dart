import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectCallScreen extends StatefulWidget {
  const DirectCallScreen({super.key});

  @override
  State<DirectCallScreen> createState() => _DirectCallScreenState();
}

class _DirectCallScreenState extends State<DirectCallScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              Container(
                constraints: const BoxConstraints.tightFor(width: 200),
                child: ElevatedButton(
                  child: const Text("Call"),
                  onPressed: () {
                    // launchUrl(Uri.parse("tel:${textEditingController.text}"));
                    launch("tel:${textEditingController.text}");
                    textEditingController.clear();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
