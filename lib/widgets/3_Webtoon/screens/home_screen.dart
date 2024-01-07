import 'package:flutter/material.dart';
import 'package:toonflix/widgets/3_Webtoon/models/webtoon_model.dart';
import 'package:toonflix/widgets/3_Webtoon/widgets/webtoon_widget.dart';

import '../services/api_service.dart';

///
/// widget loading data from api
/// - screen shows up
/// - there is no data
/// - show a loading
/// - show data when it comes
/// method 1:
///   - uses StatefulWidget
///   - uses state (which is not much used in flutter)
///   - calls build function twice
///     1. webtoons = [], isLoading = true
///     2. webtoons = [...], isLoading = false
/// method 2:
///   - better way for waiting Future
///   - fetch data with StatelessWidget
///   - FutureBuilder
///     - awaits for the Future provided
///     - snapshot: state of your Future
///       - snapshot.error
///       - snapshot.data
///       - snapshot.connectionState
///
/// ListView
/// - instead of Rows, use for many items in a row
/// - widget optimized for many objects
/// - automatic scrolling
/// ListView.builder
/// - more optimized for large data
/// - has more options
/// - destroys item that is not seen by the user!
/// - items to build is indicated with index
/// - print(index) prints only index of items shown on ui
/// - itemBuilder
///   - same as (context, snapshot) but only has access to 'index'
/// ListView.separated
/// - add one more required item 'separatorBuilder'
///
/// "Horizontal viewport was given unbounded height"
/// - happened when our ListView had infinite height inside of Column
/// - Column also has infinite height
/// - use Expanded as a constraint
///
/// Gesture Detector

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});
  // const keyword is deleted because there is a Future
  // this propagates to main.dart
  HomeScreen({super.key});

  // StatelessWidget is @immutable, so its variable must be final
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
