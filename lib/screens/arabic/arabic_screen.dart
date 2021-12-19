import 'package:flutter/material.dart';
import 'package:kids_education/screens/arabic/levels/level1.dart';
import 'package:kids_education/screens/arabic/levels/level2.dart';
import 'package:kids_education/screens/arabic/levels/level3.dart';
import 'package:kids_education/screens/arabic/levels/level4.dart';
import 'package:kids_education/screens/arabic/levels/level5.dart';
import 'package:kids_education/screens/numbers/levels/level1.dart';
import 'package:kids_education/widgets/game_levels_map.dart';
import 'package:kids_education/widgets/top_section_card.dart';

class ArabicScreen extends StatelessWidget {
  const ArabicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopSectionCard(),
          Expanded(
            child: GameLevelsMap(
              onLevel1Tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArabicLevel1(),
                  ),
                );
              },
              onLevel2Tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArabicLevel2(),
                  ),
                );
              },
              onLevel3Tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArabicLevel3(),
                  ),
                );
              },
              onLevel4Tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArabicLevel4(),
                  ),
                );
              },
              onLevel5Tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ArabicLevel5(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
