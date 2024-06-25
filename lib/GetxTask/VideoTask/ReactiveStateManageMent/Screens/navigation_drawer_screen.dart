import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Abc"),
            accountEmail: const Text("abc@gmailcom"),
            currentAccountPicture: CircleAvatar(
              child: Image.asset(
                "assets/Images/trees.webp",
                fit: BoxFit.fill,
              ),
            ),
            currentAccountPictureSize: const Size.square(72),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("A"),
              ),
            ],
            otherAccountsPicturesSize: const Size.square(50),
          ),
          const Divider(color: Colors.grey),
          buildDrawerItem(
            text: "Photo",
            icon: Icons.photo,
            textIconColor: Get.currentRoute == '/photo'
                ? Colors.pink.shade100
                : Colors.black,
            tileColor: Get.currentRoute == "/photo" ? Colors.black : null,
            onTap: () => navigate(0),
          ),
          buildDrawerItem(
            text: "Video",
            icon: Icons.video_call,
            textIconColor: Get.currentRoute == '/video'
                ? Colors.pink.shade100
                : Colors.black,
            tileColor: Get.currentRoute == "/video" ? Colors.black : null,
            onTap: () => navigate(1),
          ),
          buildDrawerItem(
            text: "Chat",
            icon: Icons.chat,
            textIconColor: Get.currentRoute == '/chat'
                ? Colors.pink.shade100
                : Colors.black,
            tileColor: Get.currentRoute == "/chat" ? Colors.black : null,
            onTap: () => navigate(2),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    Color? textIconColor,
    Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed("/photo");
    } else if (index == 1) {
      Get.toNamed("/video");
    } else {
      Get.toNamed("/chat");
    }
  }
}

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      appBar: AppBar(
        title: const Text("Photo View"),
        centerTitle: true,
      ),
    );
  }
}

class VideoViewScreen extends StatelessWidget {
  const VideoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      appBar: AppBar(
        title: const Text("Video View"),
        centerTitle: true,
      ),
    );
  }
}

class ChatViewScreen extends StatelessWidget {
  const ChatViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      appBar: AppBar(
        title: const Text("Chat View"),
        centerTitle: true,
      ),
    );
  }
}

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerScreen(),
      appBar: AppBar(
        title: const Text("Home View"),
        centerTitle: true,
      ),
    );
  }
}
