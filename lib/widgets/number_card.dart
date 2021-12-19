import 'package:flutter/material.dart';
import 'package:kids_education/constants.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, this.imagePath}) : super(key: key);
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Constants.redColor),
        color: Constants.whiteColor,
      ),
      child: imagePath == null
          ? const SizedBox()
          : Image.asset(
              imagePath!,
              height: 60,
              width: 60,
            ),
    );
  }
}
