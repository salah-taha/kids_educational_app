import 'package:flutter/material.dart';
import 'package:kids_education/widgets/game_level_point.dart';

class GameLevelsMap extends StatelessWidget {
  const GameLevelsMap({
    Key? key,
    required this.onLevel1Tap,
    required this.onLevel2Tap,
    required this.onLevel3Tap,
    required this.onLevel4Tap,
    required this.onLevel5Tap,
  }) : super(key: key);
  final Function() onLevel1Tap;
  final Function() onLevel2Tap;
  final Function() onLevel3Tap;
  final Function() onLevel4Tap;
  final Function() onLevel5Tap;

  double getRaduis(double width, double height) {
    return width < height ? width / 20 : height / 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          // double imageHeight = 1313;
          // double imageWidth = 600;

          double height = constrains.maxHeight;
          // double width = constrains.maxHeight / imageHeight * imageWidth;
          double width = constrains.maxWidth;
          // double height = constrains.maxHeight;

          return Stack(
            children: [
              Image.asset(
                'assets/map/map.png',
                fit: BoxFit.fill,
                width: width,
                height: height,
              ),
              GameLevePoint(
                left: width / 2.5 - getRaduis(width, height) / 2,
                bottom: height * 0.12 - getRaduis(width, height) / 2,
                onPressed: onLevel1Tap,
                radius: getRaduis(width, height),
                title: '1',
              ),
              GameLevePoint(
                left: width / 1.25 - getRaduis(width, height) / 2,
                bottom: height * 0.24 - getRaduis(width, height) / 2,
                onPressed: onLevel2Tap,
                radius: getRaduis(width, height),
                title: '2',
              ),
              GameLevePoint(
                left: width / 2.2 - getRaduis(width, height) / 2,
                bottom: height * 0.4 - getRaduis(width, height) / 2,
                onPressed: onLevel3Tap,
                radius: getRaduis(width, height),
                title: '3',
              ),
              GameLevePoint(
                left: width / 8 - getRaduis(width, height) / 2,
                bottom: height * 0.57 - getRaduis(width, height) / 2,
                onPressed: onLevel4Tap,
                radius: getRaduis(width, height),
                title: '4',
              ),
              GameLevePoint(
                left: width / 2.4 - getRaduis(width, height) / 2,
                bottom: height * 0.78 - getRaduis(width, height) / 2,
                onPressed: onLevel5Tap,
                radius: getRaduis(width, height),
                title: '5',
              ),
            ],
          );
        },
      ),
    );
  }
}
