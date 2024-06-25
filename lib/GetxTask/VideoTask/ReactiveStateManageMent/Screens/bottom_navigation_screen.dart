import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends GetView<BottomNavigationController> {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const [
            Center(
              child: Text("Home"),
            ),
            Center(
              child: Text("Wishlist"),
            ),
            Center(
              child: Text("Cart"),
            ),
            Center(
              child: Text("Profile"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.favorite, title: "Wishlist"),
            TabData(iconData: Icons.shopping_cart, title: "Cart"),
            TabData(iconData: Icons.person, title: "Profile"),
          ],
          onTabChangedListener: (position) {
            controller.currentIndex.value = position;
            controller.pageController.jumpToPage(position);
          },
          initialSelection: controller.currentIndex.value,
          key: controller.globalKey,
          inactiveIconColor: Colors.grey,
          activeIconColor: Colors.white,
          circleColor: Colors.pink.shade200,
        ),
      ),
    );
  }
}
