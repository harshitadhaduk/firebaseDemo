import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

class ResponsiveScreenDemo extends GetResponsiveView {
  ResponsiveScreenDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResponsiveDesignFirstWay(),
      ),
    );
  }
}

class ResponsiveDesignFirstWay extends GetResponsiveView {
  ResponsiveDesignFirstWay({super.key});

  @override
  Widget builder() {
    if (screen.isPhone) {
      return renderWidget(
          iconData: Icons.phone, color: Colors.blue, text: "Phone");
    } else if (screen.isDesktop) {
      return renderWidget(
          iconData: Icons.desktop_windows, color: Colors.red, text: "Desktop");
    } else if (screen.isTablet) {
      return renderWidget(
          iconData: Icons.tablet, color: Colors.green, text: "Tablet");
    } else if (screen.isWatch) {
      return renderWidget(
          iconData: Icons.watch, color: Colors.orange, text: "Watch");
    }
    return renderWidget(
        iconData: Icons.phone, color: Colors.blue, text: "Phone");
  }

  renderWidget({
    required IconData iconData,
    required Color color,
    required String text,
  }) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 100,
          color: color,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}

class ResponsiveDesignSecondWay extends GetResponsiveView {
  ResponsiveDesignSecondWay({super.key, alwaysUseBuilder = false});

  @override
  Widget phone() =>
      renderWidget(iconData: Icons.phone, color: Colors.blue, text: "Phone");
  Widget desktop() => renderWidget(
      iconData: Icons.desktop_windows, color: Colors.red, text: "Desktop");
  Widget tablet() =>
      renderWidget(iconData: Icons.tablet, color: Colors.green, text: "Tablet");
  Widget watch() =>
      renderWidget(iconData: Icons.watch, color: Colors.orange, text: "Watch");

  renderWidget({
    required IconData iconData,
    required Color color,
    required String text,
  }) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 100,
          color: color,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}
