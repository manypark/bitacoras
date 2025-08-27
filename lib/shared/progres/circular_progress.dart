import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {

  final Color color;
  final double strokeWidth;

  const CircularProgress({
    super.key,
    this.strokeWidth = 1,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color       : color,
      strokeWidth : strokeWidth,
    );
  }
}