import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

enum DiffSign { more, less, equal }

class NumbersLevel5 extends StatefulWidget {
  const NumbersLevel5({Key? key}) : super(key: key);

  @override
  State<NumbersLevel5> createState() => _NumbersLevel5State();
}

class _NumbersLevel5State extends State<NumbersLevel5> {
  final player = AudioPlayer();
  late YoutubePlayerController _controller;
  bool isPlaying = false;
  int score = 0;
  late int firstNum;
  late int secondNum;

  @override
  void initState() {
    super.initState();
    generateNumbers(true);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=J5jwpjD7d5Q')!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  void generateNumbers(bool init) {
    int? temp;
    if (!init) temp = firstNum + secondNum;
    var r1 = Random().nextInt(6);
    var r2 = Random().nextInt(5);

    firstNum = r1;
    secondNum = r2;
    if (temp == firstNum + secondNum) {
      return generateNumbers(false);
    }
  }

  void chooseAnswer(DiffSign answer) async {
    var trueAnswer = firstNum < secondNum
        ? DiffSign.more
        : firstNum > secondNum
            ? DiffSign.less
            : DiffSign.equal;
    if (answer == trueAnswer) {
      score++;
      if (score >= 10) {
        // show good job dialog
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("أحسنت"),
            content: const Text("انتهي المستوي الخامس"),
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
      generateNumbers(false);
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constants.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: Constants.defaultPadding,
                        margin: Constants.defaultPadding,
                        decoration: BoxDecoration(
                            color: Constants.darkBlueColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            '$firstNum',
                            style: Constants.largeTitleTextStyle,
                          ),
                        ),
                      ),
                      Container(
                        padding: Constants.defaultPadding,
                        margin: Constants.defaultPadding,
                        decoration: BoxDecoration(
                            color: Constants.darkBlueColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            '$secondNum',
                            style: Constants.largeTitleTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: DiffSign.values
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
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    e == DiffSign.more
                                        ? '<'
                                        : e == DiffSign.less
                                            ? '>'
                                            : '=',
                                    style: Constants.largeTitleTextStyle,
                                  ),
                                ),
                              ),
                            ),
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
