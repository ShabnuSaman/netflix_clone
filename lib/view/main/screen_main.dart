import 'package:flutter/material.dart';
import 'package:netflix/view/downloads/screen_downloads.dart';
import 'package:netflix/view/fast%20laugh/screen_fast_laugh.dart';
import 'package:netflix/view/home/screen_home.dart';
import 'package:netflix/view/main/widgets/bottom_navigation.dart';
import 'package:netflix/view/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/view/search/screen_search.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  final _pages = [
    const ScreenHome(),
    ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, newIndex, _) {
              return _pages[newIndex];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
