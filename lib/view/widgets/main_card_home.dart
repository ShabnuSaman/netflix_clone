import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class MainCardHome extends StatelessWidget {
  MainCardHome({super.key, required this.image});
  String image;
  String imageBase = 'https://image.tmdb.org/t/p/w355_and_h200_multi_faces/';

  @override
  Widget build(BuildContext context) {
    image = imageBase + image;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          color: kWhiteColor,
        ),
      ),
    );
  }
}
