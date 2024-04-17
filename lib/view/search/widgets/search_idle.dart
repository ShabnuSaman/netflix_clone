import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/popular/popular.dart';
import 'package:netflix/view/search/widgets/search_title.dart';
import 'package:netflix/view/search/widgets/top_searched.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/2bpJtl7GzjeceQJz6YnfMLOhlIU.jpg';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key, required this.popular});
  List<Popular> popular;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitleWidget(title: 'Top Searches'),
        kHight,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => TopSearchedListTile(
                    url: popular[index].imagePath,
                    movieName: popular[index].title),
                separatorBuilder: (context, index) => const SizedBox(),
                itemCount: popular.length),
          ),
        )
      ],
    );
  }
}
