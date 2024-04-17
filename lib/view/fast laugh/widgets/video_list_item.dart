import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';
import 'package:video_player/video_player.dart';

class VideoListItemWidget extends StatefulWidget {
  final int index;
  final String videoUrl;

  VideoListItemWidget({Key? key, required this.index, required this.videoUrl})
      : super(key: key);

  @override
  State<VideoListItemWidget> createState() => _VideoListItemWidgetState();
}

class _VideoListItemWidgetState extends State<VideoListItemWidget> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[widget.index]);
    setState(() {});
  }

  void videoController({required String videoPath}) {
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          _videoPlayerController.dispose();
        });
        videoController(videoPath: videoPathList[value]);
      },
      scrollDirection: Axis.vertical,
      children: List.generate(videoPathList.length, (index) {
        return Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController))
                  : Center(child: const CircularProgressIndicator()),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black.withOpacity(.8),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isVolume = !isVolume;
                            });
                            if (_videoPlayerController.value.volume == 0.0) {
                              _videoPlayerController.setVolume(1.0);
                            } else {
                              _videoPlayerController.setVolume(0.0);
                            }
                          },
                          icon: isVolume
                              ? Icon(CupertinoIcons.speaker_slash_fill)
                              : Icon(CupertinoIcons.volume_up)),
                    ),

                    // Right side
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(imageURL),
                        ),
                        VideoActions(icon: Icons.emoji_emotions, title: 'Lol'),
                        VideoActions(icon: Icons.add, title: 'Add List'),
                        VideoActions(icon: Icons.share, title: 'Share'),
                        VideoActions(
                            icon: !isPlay
                                ? CupertinoIcons.play_circle
                                : CupertinoIcons.pause_circle,
                            title: !isPlay ? 'Play' : 'Pause',
                            onPress: () {
                              setState(() {
                                isPlay = !isPlay;
                                _videoPlayerController.value.isPlaying
                                    ? _videoPlayerController.pause()
                                    : _videoPlayerController.play();
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onPress;

  const VideoActions({
    Key? key,
    required this.icon,
    required this.title,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress != null ? () => onPress!() : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 30),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

List<String> videoPathList = [
  'https://media.istockphoto.com/id/1455772765/video/waterfall-with-fresh-water-in-the-romantic-and-idyllic-tropical-jungle-rainforest-blue.mp4?s=mp4-640x640-is&k=20&c=-ufHs0M4TG0HCyntsf3RwpHP08EEtAlSv8APcZe6Ciw=',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

String imageUrl = 'URL_TO_YOUR_IMAGE'; // Provide the URL of your image here

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: VideoListItemWidget(index: 0, videoUrl: videoPathList[0]),
    ),
  ));
}
