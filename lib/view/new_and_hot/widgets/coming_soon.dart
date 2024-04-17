import 'package:flutter/material.dart';
import 'package:netflix/model/top_rated/top_rated.dart';
import 'package:netflix/view/new_and_hot/widgets/coming_soon_content.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({super.key, required this.comingMovies});
  List<TopRated> comingMovies = [];

  @override
  Widget build(BuildContext context) {
    print(comingMovies.length);
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: comingMovies.length,
      itemBuilder: (context, index) {
        return ComingSoonContentWidget(
            width: width, topRated: comingMovies[index]);
      },
      shrinkWrap: true,
    );
  }
}
