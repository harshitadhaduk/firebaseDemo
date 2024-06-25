import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/GetConnectAndGetMixin/Controller/popular_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularScreen extends GetView<PopularController> {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PopularController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular HomeView"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isDataProcessing.value) {
            return Center(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: const CircularProgressIndicator(),
              ),
            );
          } else {
            if (controller.isDataError.value) {
              return FailureView(onPressed: () => controller.getPopular());
            } else {
              return CarouselSlider(
                items: generateSlider(),
                options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              );
            }
          }
        },
      ),
    );
  }

  List<Widget> generateSlider() {
    List<Widget> imageSliders = controller.isPopular.map((item) {
      return Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: item["image_thumbnail_path"],
            fit: BoxFit.cover,
            width: Get.width,
            placeholder: (context, url) => Container(
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
      );
    }).toList();
    return imageSliders;
  }
}

class FailureView extends StatelessWidget {
  final String title, msg;
  final Function onPressed;
  const FailureView(
      {super.key,
      this.title = "Error",
      this.msg = "Something Went Wrong",
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 150,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 2),
            Text(
              msg,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(height: 2),
            ElevatedButton(
              onPressed: onPressed(),
              child: const Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
