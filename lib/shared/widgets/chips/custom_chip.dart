import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class CustomChip extends StatelessWidget {

  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CustomChip({
    super.key,
    required this.text,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label           : Text(
        text,
        style: GlobalFonts.paragraphBodyMediumBold.copyWith(color: textColor),
      ),
      backgroundColor : backgroundColor,
      side            : BorderSide.none,
      labelPadding    : EdgeInsets.all(0),
    );
  }
}