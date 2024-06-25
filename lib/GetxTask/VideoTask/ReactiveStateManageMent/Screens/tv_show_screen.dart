import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Controller/all_controller.dart';
import 'package:firebase_demo/GetxTask/VideoTask/ReactiveStateManageMent/Screens/GetXApi/productmodule/ApiModule/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class TvShowScreen extends GetView<TvController> {
  const TvShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TvController(TvShowRepository(ApiProvider())));
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            itemCount: state!.length,
            separatorBuilder: (context, index) {
              return const Divider(color: Colors.grey);
            },
            itemBuilder: (context, index) {
              return ListTile(
                leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: state[index].imageThumbnailPath,
                    placeholder: (context, url) => const Center(
                      child: SkeletonAvatar(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
                title: Text(state[index].name),
                subtitle: Text("${state[index].country}"),
              );
            },
          ),
          onLoading: SkeletonListView(),
          onError: (error) => Center(
            child: Text("$error"),
          ),
        ),
      ),
    );
  }
}
