import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kWhiteColor),
        Text(title,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold))
      ],
    );
  }
}
