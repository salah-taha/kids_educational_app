import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArabicLevel4 extends StatefulWidget {
  const ArabicLevel4({Key? key}) : super(key: key);

  @override
  State<ArabicLevel4> createState() => _ArabicLevel4State();
}

class _ArabicLevel4State extends State<ArabicLevel4> {
  final player = AudioCache();
  late YoutubePlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=LyzupN62MGA")!,
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
