import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_education/widgets/homcard.dart';

import '../constants.dart';
import '../widgets/background.dart';
import '../widgets/number_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            Container(
              padding: Constants.defaultPadding.copyWith(top: 32),
              color: Constants.darkBlueColor,
              child: const Center(
                child: Text(
                  'تعلم واستمتع',
                  style: Constants.largeTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: Constants.horizontalPadding,
                children: [
                  const SizedBox(height: 5),

                  const SizedBox(height: 5),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      for (int i = 0; i <= 2; i++)
                        HomeCard(
                          number: i,
                        ),
                    ],
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
