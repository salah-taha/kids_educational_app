import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/number_card.dart';
import 'package:kids_education/widgets/top_section_card.dart';
import 'package:video_player/video_player.dart';

class NumbersLevel1 extends StatefulWidget {
  const NumbersLevel1({Key? key}) : super(key: key);

  @override
  State<NumbersLevel1> createState() => _NumbersLevel1State();
}

class _NumbersLevel1State extends State<NumbersLevel1> {
  final player = AudioPlayer();
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/numbers/arabic_numbers_song.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
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
                Row(
                  children: [
                    const Text(
                      'الأرقام',
                      style: Constants.titleTextStyle,
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/symbols/infinity.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    for (int i = 0; i <= 9; i++)
                      GestureDetector(
                        onTap: () {
                          if (i > 0) {
                            try {
                              player.setAsset(
                                  "assets/numbers/sound_number_${i}_arabic.mp3");
                              player.play();
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: GridCard(
                          imagePath: 'assets/numbers/$i.png',
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
