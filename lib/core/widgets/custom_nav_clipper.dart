import 'package:flutter/material.dart';

class CustomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final center = size.width / 2;

    path.lineTo(center - 70, 0);

    path.quadraticBezierTo(
      center - 36, 0,
      center - 24, 23,
    );

    path.arcToPoint(
      Offset(center + 27, 22),
      radius: const Radius.circular(32),
      clockwise: false,
    );

    path.quadraticBezierTo(
      center + 36, 0,
      center + 70, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}