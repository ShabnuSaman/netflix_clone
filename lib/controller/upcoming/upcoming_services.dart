import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/model/upcoming/upcoming.dart';

const url =
    'https://api.themoviedb.org/3/movie/popular?api_key=599db4cbf9ae4345b53ed08d01450277#';
Future<List<Upcoming>> getAllUpcoming() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final bodyAsResponse = jsonDecode(response.body) as Map;
    final result = UpcomingList.fromJson(bodyAsResponse['results']);
    print(result.upcomingList[0].imagePath);
    return result.upcomingList;
  } else {
    return [];
  }
}
