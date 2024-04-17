import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

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
    ;
  }
}
