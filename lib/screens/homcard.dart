import 'package:flutter/material.dart';

import '../constants.dart';
class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Constants.redColor),
        color: Constants.whiteColor,
      ),
      child: Image.asset(
        'assets/labels/$number.png',
        height: 60,
        width: 60,
      ),
    );
  }
}
