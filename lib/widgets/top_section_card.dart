import 'package:flutter/material.dart';
import 'package:kids_education/constants.dart';

class TopSectionCard extends StatelessWidget {
  const TopSectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'top_section_card',
      child: Container(
        padding: Constants.defaultPadding.copyWith(top: 32),
        color: Constants.darkBlueColor,
        child: const Center(
          child: Text(
            'تعلم واستمتع',
            style: Constants.largeTitleTextStyle,
          ),
        ),
      ),
    );
  }
}
