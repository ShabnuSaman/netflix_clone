import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class SearchTitleWidget extends StatelessWidget {
  final String title;
  SearchTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: kWhiteColor,
      ),
    );
  }
}
