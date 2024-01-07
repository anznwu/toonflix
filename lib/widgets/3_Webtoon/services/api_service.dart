import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/widgets/3_Webtoon/models/webtoon_detail_model.dart';
import 'package:toonflix/widgets/3_Webtoon/models/webtoon_episode_model.dart';

import '../models/webtoon_model.dart';

///
/// pubspec.yaml
/// - add dependencies
/// - http: ^0.13.5
/// OR
/// - flutter pub add http
/// - flutter pub add url_launcher
///   - have to add config files details to ios/andriod
///   - andriod/app/main/AndriodManifest.xml
///   - ios/Runner/info.plist
///
/// Future
/// - async programming
/// - need to wait for http.get to finish
/// - async function's return type is Future
///
/// static method, variables
/// - this class holds no state
///
class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error();
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    } else {
      throw Error();
    }
  }
}
