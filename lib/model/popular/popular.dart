class Popular {
  int id;
  String title;
  String overview;
  String releaseDate;
  String imagePath;

  String imageBase = 'https://image.tmdb.org/t/p/w355_and_h200_multi_faces/';

  Popular(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.imagePath});

  factory Popular.fromJson(Map<String, dynamic> json) {
    return Popular(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        imagePath: json['poster_path']);
  }
}

class PopularList {
  List<Popular> popularList;
  PopularList({required this.popularList});

  factory PopularList.fromJson(List<dynamic> json) {
    List<Popular> popularList = [];
    popularList = json.map((top) => Popular.fromJson(top)).toList();
    return PopularList(popularList: popularList);
  }
}
