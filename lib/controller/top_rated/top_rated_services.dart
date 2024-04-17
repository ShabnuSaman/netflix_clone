import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/model/top_rated/top_rated.dart';

String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=599db4cbf9ae4345b53ed08d01450277#';

Future<List<TopRated>> getTopRatedMovies() async {
  final _response = await http.get(Uri.parse(getUrl));
  if (_response.statusCode == 200) {
    final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
    final _data = TopRatedList.fromJson(_bodyAsJson['results']);
    print(_data.topRatedList[1].title);
    return _data.topRatedList;
  } else {
    return [];
  }
}
