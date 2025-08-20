import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class CountsWithoutLogs extends StatelessWidget {

  const CountsWithoutLogs({ super.key });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label           : Text( 
        'Sin Bitacoras',
        style: GlobalFonts.paragraphBodyMediumBold.copyWith(color: Colors.red.shade300),
      ),
      backgroundColor : Colors.red.shade100,
      side            : BorderSide.none,
      labelPadding    : EdgeInsets.all(0),
    );
  }
}