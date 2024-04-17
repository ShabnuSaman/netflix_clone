import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/upcoming/upcoming.dart';
import 'package:netflix/view/home/widgets/number_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  NumberTitleCard({super.key, required this.upcoming});
  List<Upcoming> upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows In India Today'),
        kHight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                      index: index,
                      image: upcoming[index].imagePath,
                    )),
          ),
        )
      ],
    );
  }
}
