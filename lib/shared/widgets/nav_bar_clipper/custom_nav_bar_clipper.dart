import 'package:flutter/material.dart';

class CustomNavBarClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    double arcRadius  = 70;
    double arcWidth   = 120;

    Path path = Path()
      ..lineTo(size.width / 2 - arcWidth / 2, 0)
      ..quadraticBezierTo(
        size.width / 2, arcRadius, size.width / 2 + arcWidth / 2, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}