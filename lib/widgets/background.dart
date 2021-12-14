import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: Image.asset('assets/blobs/blob1.png'),
          top: -100,
          left: -150,
        ),
        Positioned(
          child: Image.asset('assets/blobs/blob2.png'),
          right: -400,
          bottom: 0,
          top: 0,
        ),
        Positioned(
          child: Image.asset('assets/blobs/blob3.png'),
          bottom: -200,
          left: -200,
        ),
        child
      ],
    );
  }
}
