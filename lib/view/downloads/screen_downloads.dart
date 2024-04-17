import 'package:flutter/material.dart';
import 'package:netflix/view/downloads/widgets/section2.dart';
import 'package:netflix/view/downloads/widgets/section3.dart';
import 'package:netflix/view/downloads/widgets/smart_download.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final _widgetList = [
    const SmartDownloadWidget(),
    Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          )),
      body: ListView.separated(
        padding: const EdgeInsets.all(25),
        itemCount: _widgetList.length,
        itemBuilder: (context, index) {
          return _widgetList[index];
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }
}
