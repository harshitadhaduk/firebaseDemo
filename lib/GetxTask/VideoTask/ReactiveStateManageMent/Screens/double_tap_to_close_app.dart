import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';

class DoubleTapToCloseAppScreen extends StatefulWidget {
  const DoubleTapToCloseAppScreen({super.key});

  @override
  State<DoubleTapToCloseAppScreen> createState() =>
      _DoubleTapToCloseAppScreenState();
}

class _DoubleTapToCloseAppScreenState extends State<DoubleTapToCloseAppScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: DoubleTapToExit(
          snackBar: SnackBar(
            content: Text("Tap again to Exit"),
          ),
          child: Text("Double Tap"),
        ),
      ),
    );
  }
}
