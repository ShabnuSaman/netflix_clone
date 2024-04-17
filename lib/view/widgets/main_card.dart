import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageBase + url), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
