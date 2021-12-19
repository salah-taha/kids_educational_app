import 'package:flutter/material.dart';
import 'package:kids_education/screens/arabic/arabic_screen.dart';
import 'package:kids_education/screens/numbers/numbers_screen.dart';
import 'package:kids_education/widgets/home_card.dart';
import 'package:kids_education/widgets/top_section_card.dart';

import '../constants.dart';
import '../widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  HomeCard(
                    imagePath: 'assets/labels/0.png',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ArabicScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  HomeCard(
                    imagePath: 'assets/labels/1.png',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NumbersScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  HomeCard(
                    imagePath: 'assets/labels/2.png',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
