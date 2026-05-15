import 'package:flutter/material.dart';

class CustomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final center = size.width / 2;

    path.lineTo(center - 70, 0);

    path.quadraticBezierTo(
      center - 35, 0,
      center - 25, 20,
    );

    path.arcToPoint(
      Offset(center + 25, 20),
      radius: const Radius.circular(40),
      clockwise: false,
    );

    path.quadraticBezierTo(
      center + 35, 0,
      center + 70, 0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}