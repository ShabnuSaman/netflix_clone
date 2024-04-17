import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class SmartDownloadWidget extends StatelessWidget {
  const SmartDownloadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(Icons.settings, color: kWhiteColor),
        kWidth,
        Text(
          'Smart downloads for you',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
