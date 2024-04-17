import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/debouncer/debouncer.dart';
import 'package:netflix/controller/popular/popular_service.dart';
import 'package:netflix/controller/searched/searched_services.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/popular/popular.dart';
import 'package:netflix/model/searched/searched.dart';
import 'package:netflix/view/search/widgets/search_idle.dart';
import 'package:netflix/view/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final _controller = TextEditingController();
  final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  List<Popular> popular = [];
  List<Movie> searched = [];
  bool isTaped = true;
  Future getPopular() async {
    popular = await getAllPopular();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: _controller,
              padding: const EdgeInsets.all(8),
              backgroundColor: kGreyColor.withOpacity(.4),
              prefixIcon: const Icon(CupertinoIcons.search, color: kGreyColor),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: kGreyColor),
              style: const TextStyle(color: kWhiteColor),
              onChanged: (value) {
                _debouncer.call(() async {
                  searched = await searchResult(value);
                  setState(() {
                    value.isEmpty ? isTaped = true : isTaped = false;
                  });
                });
              },
            ),
            kHight,
            _isEmpty(_controller.text)
          ],
        ),
      )),
    );
  }

  Widget _isEmpty(String value) {
    return isTaped
        ? Expanded(child: SearchIdleWidget(popular: popular))
        : Expanded(child: SearchResultWidget(searched: searched));
  }
}
