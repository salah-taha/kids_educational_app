import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StoryView extends StatefulWidget {
  const StoryView({Key? key, required this.story}) : super(key: key);
  final Story story;

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  final player = AudioCache();
  late YoutubePlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.story.url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidget(
      child: Column(
        children: [
          const TopSectionCard(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.story.title, style: Constants.titleTextStyle),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
