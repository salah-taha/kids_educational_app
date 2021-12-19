import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/number_card.dart';
import 'package:kids_education/widgets/top_section_card.dart';
import 'package:video_player/video_player.dart';

class ArabicLevel1 extends StatefulWidget {
  const ArabicLevel1({Key? key}) : super(key: key);

  @override
  State<ArabicLevel1> createState() => _ArabicLevel1State();
}

class _ArabicLevel1State extends State<ArabicLevel1> {
  AudioPlayer player = AudioPlayer();
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/alphabet/arabic_alphabet_song.mp4')
          ..initialize().then((_) {
            setState(() {});

            _controller.addListener(() {
              setState(() {
                isPlaying = _controller.value.isPlaying;
              });
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
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
              physics: const BouncingScrollPhysics(),
              padding: Constants.defaultPadding,
              children: [
                _controller.value.isInitialized
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller.pause();
                                  setState(() {
                                    isPlaying = false;
                                  });
                                },
                                child: VideoPlayer(
                                  _controller,
                                ),
                              ),
                              if (!isPlaying)
                                GestureDetector(
                                  onTap: () {
                                    _controller.play();
                                    setState(() {
                                      isPlaying = true;
                                    });
                                  },
                                  child: Center(
                                    child: CircleAvatar(
                                      backgroundColor: Constants.darkBlueColor,
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      child: const Icon(
                                        Icons.play_arrow,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                const Text(
                  'الأحرف',
                  style: Constants.titleTextStyle,
                ),
                const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    for (int i = 1; i <= Constants.arabicLetters.length; i++)
                      GestureDetector(
                        onTap: () {
                          try {
                            player.setAsset('assets/alphabet/$i.mp3',
                                preload: true);
                            player.play();
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: GridCard(
                          imagePath: 'assets/alphabet/$i.png',
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
