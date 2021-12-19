import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart' hide AudioPlayer;
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/top_section_card.dart';

class ArabicLevel5 extends StatefulWidget {
  const ArabicLevel5({Key? key}) : super(key: key);

  @override
  State<ArabicLevel5> createState() => _ArabicLevel5State();
}

class _ArabicLevel5State extends State<ArabicLevel5> {
  final player = AudioCache();
  final audioPlayer = AudioPlayer();
  int score = 0;
  late int num;

  @override
  void initState() {
    super.initState();
    num = Random().nextInt(28);
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
    audioPlayer.stop();
    if (answer == num) {
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
      await player.play('sounds/correct.mp3');

      var temp = num;
      num = Random().nextInt(28);
      while (num == temp) {
        num = Random().nextInt(28);
      }
      setState(() {});
    } else {
      player.play('sounds/wrong.mp3');
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
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
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: Constants.defaultPadding,
                  decoration: BoxDecoration(
                      color: Constants.darkBlueColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () {
                      audioPlayer.setAsset('assets/alphabet/${num + 1}.mp3');
                      audioPlayer.play();
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/alphabet/${num + 1}-icon.png',
                            scale: 1.3,
                          ),
                        ),
                        Text(
                          Constants.words[num].replaceRange(0, 1, "-"),
                          style: Constants.largeTitleTextStyle,
                        )
                      ],
                    ),
                  ),
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
                                      Constants.arabicLetters[e],
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
