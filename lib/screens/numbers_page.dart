import 'package:flutter/material.dart';
import 'package:kids_education/constants.dart';
import 'package:kids_education/widgets/background.dart';
import 'package:kids_education/widgets/number_card.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({Key? key}) : super(key: key);

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
                  const SizedBox(height: 16),
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
                        NumberCard(
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
