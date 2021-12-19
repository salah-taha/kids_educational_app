import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/number_card.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NumbersLevel3 extends StatefulWidget {
  const NumbersLevel3({Key? key}) : super(key: key);

  @override
  State<NumbersLevel3> createState() => _NumbersLevel3State();
}

class _NumbersLevel3State extends State<NumbersLevel3> {
  final player = AudioCache();
  late YoutubePlayerController _controller;
  bool isPlaying = false;
  int score = 0;
  late int firstNum;
  late int secondNum;

  @override
  void initState() {
    super.initState();
    firstNum = Random().nextInt(5);
    secondNum = Random().nextInt(6);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=V_rWpNQDpjM")!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  List<int> getRandomNumbers() {
    List<int> numbers = [firstNum + secondNum];
    while (numbers.length < 3) {
      int random = Random().nextInt(10);
      if (!numbers.contains(random) && random != firstNum + secondNum) {
        numbers.add(random);
      }
    }
    numbers.shuffle();
    return numbers;
  }

  void chooseAnswer(int answer) async {
    if (answer == firstNum + secondNum) {
      score++;
      if (score >= 10) {
        // show good job dialog
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("أحسنت"),
            content: const Text("انتهي المستوي الثالث"),
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
      player.play('sounds/correct.mp3');
      var temp = firstNum + secondNum;
      firstNum = Random().nextInt(5);
      secondNum = Random().nextInt(6);
      while (firstNum + secondNum == temp) {
        firstNum = Random().nextInt(5);
        secondNum = Random().nextInt(6);
      }
      setState(() {});
    } else {
      player.play('sounds/wrong.mp3');
    }
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: Constants.defaultPadding,
                        margin: Constants.defaultPadding,
                        decoration: BoxDecoration(
                            color: Constants.darkBlueColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            '$firstNum + $secondNum = ?',
                            style: Constants.largeTitleTextStyle,
                          ),
                        ),
                      ),
                    )
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
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    '$e',
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
