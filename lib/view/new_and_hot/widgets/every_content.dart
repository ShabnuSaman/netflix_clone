import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/upcoming/upcoming.dart';
import 'package:netflix/view/new_and_hot/widgets/icon_button.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class EveryonesWatchingContent extends StatelessWidget {
  EveryonesWatchingContent({
    super.key,
    required this.width,
    required this.upcoming,
  });

  final double width;
  Upcoming upcoming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHight,
          Text(
            upcoming.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          kHight,
          Text(
            upcoming.overview,
            style: TextStyle(
              color: kGreyColor,
            ),
          ),
          kHight50,
          VideoWidget(width: width, imagePath: upcoming.imagePath),
          kHight,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButttonWidget(title: 'Share ', icon: CupertinoIcons.share),
              kWidth,
              IconButttonWidget(title: 'My list ', icon: CupertinoIcons.add),
              kWidth,
              IconButttonWidget(
                  title: 'Play', icon: CupertinoIcons.play_arrow_solid),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
