import 'package:flutter/material.dart';
import 'package:netflix/view/fast%20laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  // List<Videos> videos = [];
  // Future getAllVideos() async {
  //   videos = await getVideos();
  // }

  // @override
  // void initState() {
  //   getAllVideos();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          videoPathList.length,
          (index) => VideoListItemWidget(
              index: index, videoUrl: videoPathList[index])),
    )));
  }
}
