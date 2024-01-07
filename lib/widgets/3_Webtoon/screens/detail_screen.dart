import 'package:flutter/material.dart';
import 'package:toonflix/widgets/3_Webtoon/models/webtoon_detail_model.dart';
import 'package:toonflix/widgets/3_Webtoon/models/webtoon_episode_model.dart';
import 'package:toonflix/widgets/3_Webtoon/services/api_service.dart';

import '../widgets/episode_widget.dart';
import '../widgets/image_card_widget.dart';

/// render Scaffold
/// - makes the app leave the home screen
///
/// access another class property
/// - cannot access another class property
/// - fix 1: change to StatefulWidget
///   - transforms variable title -> widget.title
///     - 'widget' access the data on StatefulWidget that holds the State
///   - but 'widget' cannot be accessed in the constructor (initializer)
///     - use initState() to initialize Future
///
/// string interpolation
/// - snapshot.data!.genre -> '${snapshot.data!.genre}'
///
/// Why change to StatefulWidget?
/// - need to access to the 'id' sent from parent (click!)
/// - Future can be used with both Stateful/Stateless
///
/// Column vs ListView
/// - ListView: more complex than what it should be
/// - Column: know the length

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: ImageCard(thumb: widget.thumb),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                }),
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
