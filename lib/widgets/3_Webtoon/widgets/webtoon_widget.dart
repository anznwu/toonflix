import 'package:flutter/material.dart';
import 'package:toonflix/widgets/3_Webtoon/screens/detail_screen.dart';
import 'package:toonflix/widgets/3_Webtoon/widgets/image_card_widget.dart';

/// Navigator
/// - can push route
/// - route wraps a widget with animation and makes it look like a screen
/// - Navigator.push stacks a Scaffold with 'back' button
/// - MaterialPageRoute.fullscreenDialog
///   - creates animation
///   - makes the route comes from bottom
///
/// Hero
/// - makes widgets animate as connected
/// - connected with 'tag'

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: ImageCard(thumb: thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
