import 'package:flutter/material.dart';

import '../constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.imagePath, required this.onPressed})
      : super(key: key);
  final String imagePath;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: Constants.defaultPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Constants.redColor),
          color: Constants.whiteColor,
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
