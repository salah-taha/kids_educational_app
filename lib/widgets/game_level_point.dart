import 'package:flutter/material.dart';

class GameLevePoint extends StatelessWidget {
  const GameLevePoint({
    Key? key,
    required this.bottom,
    required this.left,
    required this.onPressed,
    required this.radius,
    required this.title,
  }) : super(key: key);
  final double radius;
  final String title;
  final double left;
  final double bottom;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.5),
          radius: radius,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: radius - 5,
            child: Text(title),
          ),
        ),
      ),
      left: left,
      bottom: bottom,
    );
  }
}
