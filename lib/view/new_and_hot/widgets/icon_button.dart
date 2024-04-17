import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';

class IconButttonWidget extends StatelessWidget {
  const IconButttonWidget({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kWhiteColor, size: 20),
        Text(title, style: const TextStyle(color: kWhiteColor, fontSize: 10))
      ],
    );
    ;
  }
}
