import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';

class AppBarWidget extends StatelessWidget {
  String title;
  AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
        const Spacer(),
        const Icon(Icons.cast, color: Colors.white, size: 30),
        kWidth,
        Container(
            color: Colors.blue,
            height: 28,
            width: 28,
            child: Image.network(imageURL, fit: BoxFit.cover)),
        kWidth,
      ],
    );
  }
}
