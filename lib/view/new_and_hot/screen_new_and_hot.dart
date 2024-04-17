import 'package:flutter/material.dart';
import 'package:netflix/controller/top_rated/top_rated_services.dart';
import 'package:netflix/controller/upcoming/upcoming_services.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/top_rated/top_rated.dart';
import 'package:netflix/model/upcoming/upcoming.dart';
import 'package:netflix/view/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix/view/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';

class ScreenNewAndHot extends StatefulWidget {
  ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  Future getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(Icons.cast, color: Colors.white, size: 30),
              kWidth,
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 28,
                    width: 30,
                    child: Image.network(imageURL, fit: BoxFit.cover),
                  ),
                  kWidth,
                ],
              ),
            ],
            bottom: TabBar(
                labelColor: kBlackColor,
                isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: kWhiteColor, borderRadius: kBorderRadius30),
                tabs: const [
                  Tab(text: '🍿 Coming Soon'),
                  Tab(text: "👀 Everyone's Watching")
                ]),
          ),
          body: TabBarView(children: [
            ComingSoonWidget(comingMovies: comingMovies),
            EveryonesWatchingWidget(everyone: everyOne),
          ])),
    );
  }
}
