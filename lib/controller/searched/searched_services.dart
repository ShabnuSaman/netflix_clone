import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/core/constants.dart';
import 'package:netflix/model/searched/searched.dart';

Future<List<Movie>> searchResult(String movie) async {
  String resultApi =
      "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movie";
  final response = await http.get(Uri.parse(resultApi));
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body)["results"] as List;
    return responseData.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception('something went wrong');
  }
}
