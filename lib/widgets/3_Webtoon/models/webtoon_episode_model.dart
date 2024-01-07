class WebtoonEpisodeModel {
  final String id, title, rating, date;

  /// named constructors
  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
