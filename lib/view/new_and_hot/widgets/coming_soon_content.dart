import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/top_rated/top_rated.dart';
import 'package:netflix/view/new_and_hot/widgets/icon_button.dart';

class ComingSoonContentWidget extends StatelessWidget {
  const ComingSoonContentWidget(
      {super.key, required this.width, required this.topRated});

  final double width;
  final TopRated topRated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(fontSize: 16, color: kGreyColor),
              ),
              Text('11',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kGreyColor)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .6,
          width: width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: width - 50,
                    height: 180,
                    child: Image.network(imageBase + topRated.imagePath,
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: kBlackColor.withOpacity(1),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.speaker_slash_fill)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(topRated.title.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis)),
                  ),
                  const Row(
                    children: [
                      IconButttonWidget(
                          title: 'Remind me', icon: CupertinoIcons.bell),
                      kWidth,
                      IconButttonWidget(
                          title: 'Info', icon: CupertinoIcons.info),
                      kWidth
                    ],
                  )
                ],
              ),
              kHight,
              const Text('Coming on friday'),
              kHight,
              Text(
                topRated.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHight,
              Text(
                topRated.overview,
                style: const TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
