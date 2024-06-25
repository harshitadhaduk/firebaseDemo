import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class ShrinkSideMenuScreen extends GetView<ShrinkSideController> {
  const ShrinkSideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShrinkSideController());
    return SideMenu(
      key: controller.globalKey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shrink Side Menu Button"),
          leading: IconButton(
            onPressed: () {
              controller.openCloseButton();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        body: const Center(
          child: Text(
            "Side Menu",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text("Home"),
              textColor: Colors.white,
              dense: true,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.verified_user,
                color: Colors.white,
              ),
              textColor: Colors.white,
              title: const Text("Profile"),
              dense: true,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
              title: const Text("Wallet"),
              textColor: Colors.white,
              dense: true,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: const Text("Cart"),
              textColor: Colors.white,
              dense: true,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text("Favourite"),
              textColor: Colors.white,
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}
