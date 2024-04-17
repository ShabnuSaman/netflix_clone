import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/searched/searched.dart';
import 'package:netflix/view/search/widgets/search_title.dart';
import 'package:netflix/view/widgets/main_card.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/v1YEOdGptCyNxnc4mJSYNd4cE8E.jpg';

class SearchResultWidget extends StatefulWidget {
  SearchResultWidget({super.key, required this.searched});
  List<Movie> searched = [];

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitleWidget(title: 'Movie & TV shows'),
        kHight,
        Expanded(
          child: widget.searched.isNotEmpty
              ? GridView.count(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.75,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(
                      widget.searched.length,
                      (index) =>
                          MainCard(url: widget.searched[index].posterPath)))
              : const Center(
                  child: Text('No data available'),
                ),
        )
      ],
    );
  }
}
