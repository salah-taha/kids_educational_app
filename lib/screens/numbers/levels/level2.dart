import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/number_card.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NumbersLevel2 extends StatefulWidget {
  const NumbersLevel2({Key? key}) : super(key: key);

  @override
  State<NumbersLevel2> createState() => _NumbersLevel2State();
}

class _NumbersLevel2State extends State<NumbersLevel2> {
  final player = AudioPlayer();
  late YoutubePlayerController _controller;
  bool isPlaying = false;
  int score = 0;
  late int num;

  @override
  void initState() {
    super.initState();
    num = Random().nextInt(10);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=hh8ROe-YPG8&list=PLqPC1f2DzsJWzHOFbPhQPLC9I5xTRw5dN&index=4")!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  List<int> getRandomNumbers() {
    List<int> numbers = [num];
    while (numbers.length < 3) {
      int random = Random().nextInt(10);
      if (!numbers.contains(random) && random != num) {
        numbers.add(random);
      }
    }
    numbers.shuffle();
    return numbers;
  }

  void chooseAnswer(int answer) async {
    if (answer == num) {
      score++;
      if (score >= 10) {
        // show good job dialog
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("أحسنت"),
            content: const Text("انتهي المستوي الثاني"),
            actions: <Widget>[
              TextButton(
                child: const Text("حسنا"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
        return;
      }
      player.setAsset('assets/sounds/assets_win.mp3');
      player.play();
      var temp = num;
      num = Random().nextInt(10);
      while (num == temp) {
        num = Random().nextInt(10);
      }
      setState(() {});
    } else {
      player.setAsset('assets/sounds/wrong.mp3');
      player.play();
    }
  }

  @override
  void dispose() {
    player.dispose();
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
            child: ListView(
              padding: Constants.defaultPadding,
              children: [
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'تدريب',
                      style: Constants.titleTextStyle,
                    ),
                    Text('النتيجة $score', style: Constants.titleTextStyle),
                  ],
                ),
                // const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    for (int i = 0; i < 9; i++)
                      GestureDetector(
                        onTap: () {},
                        child: GridCard(
                          imagePath:
                              i < num ? 'assets/alphabet/3-icon.png' : null,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: getRandomNumbers()
                      .map((e) => Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  chooseAnswer(e);
                                },
                                child: Container(
                                    padding: Constants.defaultPadding,
                                    margin: Constants.defaultPadding,
                                    decoration: BoxDecoration(
                                        color: Constants.darkBlueColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                        child: Text(
                                      '$e',
                                      style: Constants.largeTitleTextStyle,
                                    )))),
                          ))
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
