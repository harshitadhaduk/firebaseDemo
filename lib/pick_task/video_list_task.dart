import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class VideoPickerScreen extends StatefulWidget {
  const VideoPickerScreen({super.key});

  @override
  State<VideoPickerScreen> createState() => _VideoPickerScreenState();
}

class _VideoPickerScreenState extends State<VideoPickerScreen> {
  List videoData = [];
  File? video;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.05 * height),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "PICK VIDEO",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 0.06 * width,
                        ),
                      ),
                      SizedBox(height: 0.01 * height),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? file = await picker.pickVideo(
                                  source: ImageSource.camera);
                              video = File(file!.path);
                              videoData.add(video);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.01 * height),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.black,
                                  size: 0.06 * width,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.045 * width,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              XFile? file = await picker.pickVideo(
                                  source: ImageSource.gallery);

                              video = File(file!.path);
                              videoData.add(video);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(0.01 * height),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.black,
                                  size: 0.06 * width,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 0.045 * width,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 0.035 * height,
        ),
      ),
      body: videoData.isEmpty
          ? const Center(
              child: Text('No videos'),
            )
          : ListView.builder(
              itemCount: videoData.length,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(videoFile: videoData[index]);
              },
            ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final videoFile;
  const VideoPlayerWidget({super.key, this.videoFile});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return controller.value.isInitialized
        ? Container(
            height: 0.8 * height,
            margin: EdgeInsets.symmetric(vertical: 0.02 * height),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(controller),
                InkResponse(
                  onTap: () {
                    setState(() {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();
                    });
                  },
                  child: Container(
                    height: 0.04 * height,
                    width: 0.15 * width,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(0.015 * height),
                    ),
                    child: Icon(controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                  ),
                ),
                VideoProgressIndicator(controller, allowScrubbing: true),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
