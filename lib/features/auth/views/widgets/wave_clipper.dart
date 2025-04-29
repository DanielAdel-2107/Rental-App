import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final bool isTop;
  WaveClipper({required this.isTop});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isTop) {
      path.lineTo(0, size.height * 0.8);
      path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height * 0.8);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, size.height * 0.2);
      path.quadraticBezierTo(size.width / 2, 0, size.width, size.height * 0.2);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
